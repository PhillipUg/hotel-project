require_relative "room"

class Hotel
  attr_accessor :rooms

  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each {|room_name, capacity| @rooms[room_name] = Room.new(capacity)}
  
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end 

  def room_exists?(room)
    @rooms.has_key?(room)
  end

  def check_in(person, check_in_room)     
    if !room_exists?(check_in_room)
      puts "sorry, room does not exist"
    else
      puts @rooms[check_in_room].add_occupant(person) ? "check in successful" : "sorry, room is full"
    end
  end

  def has_vacancy?  
    @rooms.values.any? {|room| room.available_space > 0}
  end

  def list_rooms
    @rooms.each {|room, space| puts "#{room} : #{space.available_space}"}
  end
end
