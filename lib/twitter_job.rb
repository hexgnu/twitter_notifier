class TwitterJob < Struct.new(:term_name)
  TWITTER_HOST = "http://search.twitter.com/search.json"
  attr_accessor :page
  
  
  def perform
    # do stuff
    if term_name.blank?
      @terms = Term.all
    else
      @terms = Term.find_all_by_term(term_name)
    end
    
    
    @terms.each do |term|
     @page = 0
     
     
     if term.term_counts.blank?
       highest_id = nil
     else
       highest_id = term.term_counts.find(:first, :order => "tweet_id DESC").tweet_id
     end
     seed_query = "?q=#{CGI.escape(term.term)}&since_id=#{highest_id}"
     parse_twitter_results(term, seed_query, highest_id)
    end
  

    @percent_change_in_terms = Term.all.inject({}) do |hash, term|
      hash[term.term.to_s] = (
          Float(term.term_counts.find(:all, :conditions => {:date => (24.hours.ago..1.second.ago)}).length) / 
          Float(term.term_counts.find(:all, :conditions => {:date => (48.hours.ago..24.hours.ago)}).length) - 1
          ) * 100
      hash
    end
    
    
    @payload = Term.all.inject([]) do |array, term|
      unless @percent_change_in_terms[term.term].infinite?
        array << term if @percent_change_in_terms[term.term] > term.threshold
      end
      array 
    end
    
    # if within threshold then deliver
    PostOffice.deliver_threshold_notification(@payload)
  end
  
  def parse_twitter_results(term, query, highest_id)
    print "Going to query string #{query}\n"
    results = HTTParty.get([TWITTER_HOST,query].join)
    
    if results.has_key?("results")
      results["results"].map do |result|
        @id = Integer(result["id"])
        term_count = term.term_counts.new(:date => Time.parse(result["created_at"]), :tweet_id => @id)
        term_count.save
      end
    end
    @page += 1
    if results.has_key?("next_page") && @id > (highest_id || 0) && @page <= 100
      parse_twitter_results(term, results["next_page"], highest_id)
    end
  end
  
  
end