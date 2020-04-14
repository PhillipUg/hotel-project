class Room
  attr_accessor :capacity, :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def full?
    @occupants.size < @capacity ? false : true
  end

  def available_space
    @capacity - @occupants.size
  end

  def add_occupant(name)
    !self.full? ? (@occupants << name; true) : false
  end
end
