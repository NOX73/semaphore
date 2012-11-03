require "semaphore/version"

module Semaphore
  autoload :TheSemaphore, 'semaphore/the_semaphore'

  def self.new(limit)
    TheSemaphore.new(limit)
  end

end
