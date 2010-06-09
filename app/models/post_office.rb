class PostOffice < ActionMailer::Base
  def threshold_notification(terms)
    logger.debug("Ok we're going to deliver this now")
    recipients    "mattk@wetpaint.com"
    from          "no-reply@wetpaint.com"
    subject       "Uh Oh, we have broken youtube videos..."
    headers       "Reply-to" => "dev@wetpaint.com"
    @sent_on      = Time.now
    @content_type = "text/html"
    body[:terms] = terms
  end
end
