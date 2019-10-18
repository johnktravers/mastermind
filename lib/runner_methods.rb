def main_menu
  system 'clear'
  print @game.start
  input = gets.chomp.downcase
  print "\n"

  loop do
    if input == 'p'
      break
    elsif input == 'i'
      print @game.instructions
      print @game.start
      input = gets.chomp.downcase
      print "\n"
    elsif input == 'q'
      abort
    else
      print @game.start
      input = gets.chomp.downcase
      print "\n"
    end
  end
end
