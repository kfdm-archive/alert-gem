module Alert
  autoload :Prowl, "alert/driver/prowl"
  autoload :Echo,  "alert/driver/echo"
  
  extend self
  
  def notify(message,options={})
    puts message
  end
end