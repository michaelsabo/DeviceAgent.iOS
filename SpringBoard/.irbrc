
require 'irb/completion'
require 'irb/ext/save-history'
require "ap"
require "run_loop"

AwesomePrint.irb!

ARGV.concat [ '--readline',
              '--prompt-mode',
              'simple']

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = '.irb-history'

IRB.conf[:AUTO_INDENT] = true

IRB.conf[:PROMPT][:SPRINGBOARD] = {
  :PROMPT_I => "springboard > ",
  :PROMPT_N => "springboard > ",
  :PROMPT_S => nil,
  :PROMPT_C => "> ",
  :AUTO_INDENT => false,
  :RETURN => "%s\n"
}

IRB.conf[:PROMPT_MODE] = :SPRINGBOARD

motd=["Let's get this done!", 'Ready to rumble.', 'Enjoy.', 'Remember to breathe.',
      'Take a deep breath.', "Isn't it time for a break?", 'Can I get you a coffee?',
      'What is a calabash anyway?', 'Smile! You are on camera!', 'Let op! Wild Rooster!',
      "Don't touch that button!", "I'm gonna take this to 11.", 'Console. Engaged.',
      'Your wish is my command.', 'This console session was created just for you.']
puts "#{motd.sample()}"

