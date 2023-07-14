class ExampleWorker
  include Sidekiq::Worker

  def perform(name)
    puts "Hello, #{name}!"
    # Do some time-consuming task here
  end
end
