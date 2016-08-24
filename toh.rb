# helper methods

def show_rules
  line_width = 60
  puts ""
  puts "Welcome to Tower of Hanoi!".center line_width
  puts ""
  puts "The object of the game is to move all of your disks from the left rod"
  puts "to either the middle rod or the right rod - one disk at a time."
  puts ""
  puts "Here are the rules:"
  puts ""
  puts "1. Only one disk can be moved at a time."
  puts "2. Each move consists of taking the upper disk from one of the stacks and"
  puts "   placing it on top of another stack i.e. a disk can only be moved if it is"
  puts "   the uppermost disk on a stack."
  puts "3. No disk may be placed on top of a smaller disk."
  puts ""
  puts "Type RENDER during your turn for a visual of the current game board.".center line_width
  puts "You may type QUIT at any time to exit the game.".center line_width
  puts ""
end
=begin

# ask user how many disks they would like to play with
# fill rod_one with number of disks in "ascending" order
def ask_for_disks
  puts "How many disks would you like to play with?"
  disks = gets.chomp.to_i
  rod_one = Array.new(disks){|disk|disk+1} # [...1,2,3,4,5,6,7,8... <- top to bottom ->]
  rod_two = []
  rod_three = []
end

# user input will be in form: [FROM, TO]
# user SELECTS which rod to move a piece FROM <- LOOP
# user SELECTS which rod to move selected piece TO
def ask_user_move
  puts "Which rod would you like to move a disk from?"
  move_from = gets.chomp
  puts "Which rod would you like to move your disk to?"
  move_to = gets.chomp
    if (move_from||move_to).upcase == "QUIT"
      exit
    elsif (move_from.to_i + move_to.to_i) > 0
      move = []
      move[0],move[1] = move_from.to_i,move_to.to_i
      p move
    else
      puts "Please enter a valid command"
    end
end

# display starting board with all disks on left rod (out of 3)

  # example "move" code
  # rod_two << rod_one.first
  # rod_one.shift

# VALIDATE piece can be moved to new rod

# main method
def tower_of_hanoi
  show_rules
  ask_for_disks
  ask_user_move

  p rod_one
  p rod_two
  p rod_three

end

tower_of_hanoi
=end

# begin game
show_rules

# determine number of disks in play
  # initialize rods

puts "How many disks would you like to play with?"
disks = gets.chomp.to_i
rod_one = Array.new(disks){|disk|disk+1} # [...1,2,3,4,5,6,7,8... <- top to bottom ->]
rod_two = []
rod_three = []

# ask user for their MOVE

  # ask user which rod they would like to move a disk FROM
rod_from = nil
rod_to = nil
puts "Which rod would you like to move a disk from?"
move_from = gets.chomp
if move_from.to_s.upcase == "QUIT"
  exit
elsif (1..3).include?(move_from.to_i)
  case move_from.to_i
  when 1
    rod_from = rod_one
  when 2
    rod_from = rod_two
  when 3
    rod_from = rod_three
  end
else
  puts "Please enter a valid command."
end

  # ask user which rod they would like to move the selected disk TO
puts "Which rod would you like to move your disk to?"
move_to = gets.chomp
if move_to.to_s.upcase == "QUIT"
  exit
elsif (1..3).include?(move_to.to_i)
  case move_to.to_i
  when 1
    rod_to = rod_one
  when 2
    rod_to= rod_two
  when 3
    rod_to = rod_three
  end
else
  puts "Please enter a valid command."
end

# validate user MOVE can be made

if rod_from == [] && rod_to == []
  puts "That move is not valid!"
elsif rod_to.first == nil || rod_from.first > rod_to.first
  rod_to << rod_from.first
  rod_from.shift
end




# user WINS if

winner = false
if (rod_two || rod_three).length == rod_one.length
  winner = true
  puts "You win!"
  exit
end









p "Rod 1: #{rod_one}"
p "Rod 2: #{rod_two}"
p "Rod 3: #{rod_three}"









