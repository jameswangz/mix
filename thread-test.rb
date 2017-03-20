require "thread"

m = Mutex.new 
c = ConditionVariable.new
t = []

a = Thread.new do
  m.synchronize do
    puts "A - I am in critical region"
    c.wait(m)
    puts "A - Back in critical region"
  end
end

sleep 1

b = Thread.new do
  m.synchronize do
    puts "B - I am critical region now"
    c.signal
    puts "B - I am done with critical region"
  end
end



[a, b].each { |t| t.join  }



