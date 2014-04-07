# UTF-8 support
export LC_CTYPE=en_US.UTF-8

# Set the path for DarwinPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Standard paths
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# Set path for PostgreSQL 9 usage, installed via MacPorts
export PATH="/opt/local/lib/postgresql91/bin:$PATH"
# Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Make sure my own small utils are available
export PATH="./bin:$HOME/bin:$PATH"

# Set a nice prompt
bold=$(tput bold)
reset=$(tput sgr0)
git_branch_name () {
  git branch &>/dev/null; if [ $? -eq 0 ]; then echo " ($(git branch | grep ^*|sed s/\*\ \//))"; fi
}
export PS1='\[$reset\]\n\[$bold\]\w$(git_branch_name)\n\$\[$reset\] '

# Don't store repeated lines in history
export HISTCONTROL="ignoredups"
# But store more lines than the default 500
export HISTSIZE=5000

export EDITOR='subl -w'

# Tweak REE settings for faster tests
# See http://www.rubyenterpriseedition.com/documentation.html#_garbage_collector_performance_tuning
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_GC_MALLOC_LIMIT=50000000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_HEAP_FREE_MIN=500000

# Tell Ruby OpenSSL to find certificates installed via MacPorts
export SSL_CERT_FILE=/opt/local/share/curl/curl-ca-bundle.crt

# Ease on manually debugging REST API services
alias apicurl="curl -H 'Accept: application/xml' -H 'Content-Type: application/xml' "
headers () {
	curl --insecure --silent --output /dev/null -D /tmp/dumped_headers $1 && cat /tmp/dumped_headers && rm /tmp/dumped_headers
}

# PostgreSQL control
alias pgstart="sudo -u postgres /opt/local/lib/postgresql91/bin/pg_ctl start -D /opt/local/var/db/postgresql91/defaultdb -l /var/log/postgresql/postgresql.log"
alias pgstop="sudo -u postgres /opt/local/lib/postgresql91/bin/pg_ctl stop -D /opt/local/var/db/postgresql91/defaultdb"

# Pow
alias powr="powder link; powder restart"

# MySQL control
alias mysqlstart="sudo /opt/local/share/mysql5/mysql/mysql.server start && ln -s /opt/local/var/run/mysql5/mysqld.sock /tmp/mysql.sock"
alias mysqlstop="sudo /opt/local/share/mysql5/mysql/mysql.server stop; unlink /tmp/mysql.sock"

# Rails shortcuts
alias ss='script/server'
alias sc='script/console'
alias sg='script/generate'
alias at='autotest'
alias as='autospec'
alias migrate='rake db:migrate && rake db:schema:dump && rake db:test:prepare'
alias be='bundle exec'

# Colorful ls
alias ls='ls -G'

# Command to open a new Terminal tab.
# From http://tomafro.net/2009/08/tip-open-new-tab-in-osx-terminal
ttab () {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
  	end
  	tell application "Terminal"
      activate
      do script with command "cd $PWD; $*" in window 1
    end tell
EOF
}

# Command to open a new iTerm window.
iterm () {
  osascript 2>/dev/null <<EOF
	  tell application "System Events"
	    tell process "iTerm" to keystroke "n" using command down
		end

		tell application "iTerm"
			tell the last terminal
				tell the last session
					write text "cd $PWD"
					write text "$*"
				end tell
			end tell
		end tell
EOF
}

# Command to open a new iTerm tab.
itab () {
  osascript 2>/dev/null <<EOF
		tell application "iTerm"
			tell the last terminal
				launch session "Default Session"
				tell the last session
					write text "cd $PWD"
					write text "$*"
				end tell
			end tell
		end tell
EOF
}

publish () {
	ruby -e 'require "webrick"
		server = WEBrick::HTTPServer.new({
			:Port => 8081,
			:DocumentRoot => ENV["PWD"],
			:MimeTypes => WEBrick::HTTPUtils::DefaultMimeTypes.update({nil => "text/html", "swf" => "application/x-shockwave-flash"})
		})
		["INT", "TERM"].each { |signal| trap(signal) { server.shutdown } }
		server.start'
}

# Single command to launch a Rails project
alias edit_rails='git fetch origin && itab autospec && itab tail -f log/test.log && itab tail -f log/development.log && itab script/server && mate .'

# Git helpers
alias grc='git rebase --continue'
alias mate_unmerged="git st | grep \"unmerged\|both modified\|both added\|added by them\" | awk -F : '{print \$2}' | while read line; do mate \$line; done"
alias git='hub' # https://github.com/defunkt/hub#readme

# Memcached
alias memcached_stop="sudo kill \`ps -A | grep /opt/local/bin/memcached | grep -v grep | grep -v daemondo | awk -F ' ' '{print \$1}'\`"

alias redis_start='/opt/local/bin/redis-server /opt/local/etc/redis.conf'

# Autocompletion for a bunch of stuff
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  source /opt/local/etc/profile.d/bash_completion.sh
fi
if [ -f /opt/local/etc/bash_completion.d/git-extras ]; then
  source /opt/local/etc/bash_completion.d/git-extras
fi
complete -C ~/dotfiles/tab_completion/rake -o default rake
complete -C ~/dotfiles/tab_completion/capistrano -o default cap
complete -C "mite auto-complete" mite

# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then
	source ~/.rvm/scripts/rvm
	rvm use 2.0
fi

# Autojump <http://github.com/joelthelion/autojump/downloads>
if [[ -s ~/dotfiles/autojump/.bash_rc ]] ; then source ~/dotfiles/autojump/.bash_rc ; fi

# Go to the Projects folder, probably where I need to start most my terminal sessions
if [ `pwd` == `echo ~` ]; then
	cd ~/Projects
fi
