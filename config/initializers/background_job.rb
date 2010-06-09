Thread.new do 
  loop do
    Delayed::Job.enqueue(TwitterJob.new)
    sleep 600
  end
end  