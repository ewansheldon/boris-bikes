require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

private

  def full?
    return true if @bikes.count >= 20
  end

  def empty?
    return true if @bikes.empty?
  end
end
