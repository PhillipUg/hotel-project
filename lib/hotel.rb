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
    @rooms.keys.include?(room)
  end

  def check_in(person, check_in_room)     
    if !room_exists?(check_in_room)
      puts "sorry, room does not exist"
    else
      puts @rooms[check_in_room].add_occupant(person) ? "check in successful" : "sorry, room is full"
    end
  end

  def has_vacancy?
    available_space = @rooms.keys.each {|room| room.full?}
    if available_space == false
      false
    else
      true
    end
  end

  def list_rooms
    @rooms.keys.each {|k| puts "#{k} . #{k.available_space}"}
  end
end

hash = {4=>"100", 2=>"200", 1=> "man"}
p hash.each {|k,v| puts "#{k} and #{v}"}