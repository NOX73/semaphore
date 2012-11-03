require 'test_helper'

class SemaphoreTest < MiniTest::Unit::TestCase

  def test_should_create_semaphore
    Semaphore.new 3
  end

  def test_should_synchronize_method
    semaphore = Semaphore.new 3
    semaphore.synchronize {

    }
  end

end