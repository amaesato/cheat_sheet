
@main_menu = { '1' => 'Command line', '2' => 'Search', '3' => 'Exit' }

def main_menu
  puts "\nMAIN MENU"
  @main_menu.each { |key, value| puts "#{key}. #{value}" }
  print "> "
  choice = gets.strip

  case choice
    when '1'
      command_menu
    when '2'
      search_command
    when '3'
      exit(0)
    else
      puts "Invalid input. Choose 1-3"
  end
end


@commands = {
  '1' => 'mkdir',
  '2' => 'ls',
  '3' => 'cd',
  '4' => 'pwd',
  '5' => 'mv',
  '6' => 'Main Menu',
  '7' => 'Search'
}

# Choose commands from a selection
def command_menu
  puts "\nCOMMAND MENU"
  @commands.each { |key, value| puts "#{key}. #{value}" }
  print '> '
  input2 = gets.strip

  case input2
    when ('1'..'5')
      puts `man #{@commands[input2]}`
      command_menu
    when '6'
      main_menu
    when '7'
      search_command
    else
      puts "Sorry, invalid input"
      command_menu
  end
end

# Search command
def search_command
  print "Search >  "

  search = gets.strip.downcase
  puts `man #{search}`
  main_menu
end


main_menu
