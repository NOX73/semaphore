require 'test_helper'

class SemaphoreTest < MiniTest::Unit::TestCase

  def test_should_create_semaphore
    semaphore = Semaphore.new 3
    assert semaphore
  end

  def test_should_synchronize_method
    var = false

    semaphore = Semaphore.new 3
    semaphore.synchronize {
      var = true
    }

    assert var
  end

  def test_check_two_threads_write
    var = []
    semaphore = Semaphore.new 1

    a = Thread.new{
      semaphore.synchronize {
        sleep 1
        100.times{ var << 1 }
        sleep 100
      }
    }

    sleep 1

    b = Thread.new{
      semaphore.synchronize {
        100.times{ var << 2 }
      }
    }

    sleep 1

    a.kill
    b.kill

    assert_equal 100, var.inject(:+)

  end

end