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
  # puts "Type RENDER during your turn for a visual of the current game board.".center line_width
  # puts ""
  # puts "You may type QUIT at any time to exit the game.".center line_width
  # puts ""
end

def quit? (from,to)
  if from.to_s.upcase == "QUIT" || to.to_s.upcase == "QUIT"
    exit
  end
end

def game_won (winning_tower,rods,moves)
  if rods[2] == winning_tower || rods[3] == winning_tower
    puts "Winner winner, chicken dinner!"
    if moves == 1
      puts "You got it on the first try!"
    else
      puts "It only took you #{moves} tries!"
    end
    exit
  end
end

# begin game
show_rules
# determine number of disks in play
# initialize rods
rods = {1=>[],2=>[],3=>[]}
puts "How many disks would you like to play with?"
disks = gets.chomp.to_i
rods[1] = (1..disks).to_a # [1,2,3,4 <-- top to bottom -->]
winning_tower = rods[1].dup
# p rods[1].object_id
# p winning_tower.object_id
moves = 0
# show game board
puts "Game starting. Good luck!"
rods.each {|rod,disk_number|puts "Rod #{rod}: #{disk_number}"} # displays starting board (can be re-used to display board)
# play the actual game
while true
  # get the user's move
  puts "Which rod would you like to move a disk FROM?"
  from = gets.chomp
  puts "Which rod would you like to move the selected disk TO?"
  to = gets.chomp
  # check if user wants to quit
  quit?(from,to)
  # format user's move
  move_from,move_to = from.to_i,to.to_i
  move_from = rods[move_from] # move_from uses rod's value
  move_to = rods[move_to] # move_to uses rod's value
  # validate the user's move
  if move_from.none?
    puts "You cannot select an empty rod"
  elsif move_to.none? || move_from.first < move_to.first
    move_to.unshift(move_from.first)
    move_from.shift    
  else
    puts "Please enter a valid move."
  end
  # display game board after each move
  rods.each {|rod,disk_number|puts "Rod #{rod}: #{disk_number}"}
  moves += 1
  # check if game has been won
  game_won(winning_tower,rods,moves)
end
