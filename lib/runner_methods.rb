def main_menu
  system 'clear'
  prompt_start

  loop do
    if @input == 'p'
      break
    elsif @input == 'i'
      print @game.instructions
      prompt_start
    elsif @input == 'q'
      abort
    else
      prompt_start
    end
  end
end

def take_turn
  loop do
    prompt_turn_input
    if @input.length == 4
      @game.check_guess(@input)
      break
    elsif @input == 'q'
      abort
    elsif @input == 'c'
      print @game.cheat
      abort
    elsif @input.length > 4
      print @game.guess_too_long
    elsif @input.length < 4
      print @game.guess_too_short
    end
  end
end



private
def prompt_start
  print @game.start
  @input = gets.chomp.downcase
  print "\n"
end

def prompt_turn_input
  print @game.prompt_turn
  @input = gets.chomp.downcase
  print "\n"
end
