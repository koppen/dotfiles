require 'rubygems'
require 'irb/completion'
require 'pp'
require 'looksee/shortcuts'

# Persist command history across irb sessions
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
