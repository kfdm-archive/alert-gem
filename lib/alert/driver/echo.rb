module Alert
  module Echo
    extend self

    def notify(message,options={})
      puts message
    end
  end
end

if __FILE__ == $0
  Alert::Echo.notify("Testing #{__FILE__}")
end
