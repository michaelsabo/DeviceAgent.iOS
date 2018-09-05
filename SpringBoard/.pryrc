begin
  require 'pry'

  Pry.config.history.should_save = false
  Pry.config.history.should_load = false
  # Hit Enter to repeat last command

  Pry::Commands.command /^$/, "repeat last command" do
    _pry_.run_command Pry.history.to_a.last
  end
rescue LoadError => e
  puts "Could not load a requirement: #{e}"
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
else
  puts "PryByBug is not not defined"
end
