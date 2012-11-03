class TheSemaphore
  attr_reader :limit

  def initialize(limit)
    @limit = limit
    @in_critical = 0
    @mutex = Mutex.new
  end

  def synchronize
    until critical_in
      sleep 0.1
    end
    yield
    critical_out
  end

  private

    def critical_in
      entered = false
      @mutex.synchronize {
        return if @in_critical == @limit
        @in_critical += 1
        entered = true
      }
      entered
    end

    def critical_out
      @mutex.synchronize{
        @in_critical -= 1
      }
    end
end