Thread.new do 
  loop do
    a = TwitterJob.new
    a.perform
    sleep 600
  end
end  