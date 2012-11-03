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

  def test_two_threads
    var = []
    threads = []
    semaphore = Semaphore.new 1

    threads << Thread.new{ semaphore.synchronize {
      100.times{ var << 1 }
      sleep 100
    }}

    sleep 1

    threads << Thread.new{ semaphore.synchronize {
      100.times{ var << 2 }
    }}

    sleep 1

    threads.map(&:kill)

    assert_equal 100, var.inject(:+)
  end

  def test_multi_threads
    var = { a: [], b: [], c: [], }
    threads = []

    semaphore = Semaphore.new 2

    threads << Thread.new{ semaphore.synchronize {
      100.times{ var[:a] << 1 }
      sleep 100
    }}

    threads << Thread.new{ semaphore.synchronize {
      100.times{ var[:b] << 2 }
      sleep 100
    }}

    sleep 1

    threads << Thread.new{ semaphore.synchronize {
      100.times{ var[:c] << 3 }
    }}

    sleep 1

    threads.map(&:kill)

    sum = (var[:a] + var[:b] + var[:c]).inject(:+)

    assert_equal 300, sum
  end

end