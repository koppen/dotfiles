# UTF-8 support
export LC_CTYPE=en_US.UTF-8

# Set the path for DarwinPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Standard paths
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Set path for PostgreSQL 8.4 usage, installed via MacPorts
export PATH="/opt/local/lib/postgresql84/bin:$PATH"

# Set a nice prompt
# export PS1="\\e[1m\\u@\\h:\\w\\\$\\e[m "
# Alternative prompt from http://blog.teksol.info/2009/01/12/productivity-tip-a-simple-change-to.html. Puts the git
# branch name into the prompt.
export PS1='\n\[\e[1m\]\w\[\e[m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo " (\[\033[00m\]$(git branch | grep ^*|sed s/\*\ \//))"; fi) \n\$\[\033[00m\] '

# Don't store repeated lines in history
export HISTCONTROL="ignoredups"

# I ♥ TextMate
export EDITOR='mate -w' # -w means wait for TextMate to close the file

# Ease on manually debugging REST API services
alias apicurl="curl -H 'Accept: application/xml' -H 'Content-Type: application/xml' "

# PostgreSQL control
alias pgstart="sudo -u postgres /opt/local/lib/postgresql84/bin/pg_ctl start -D /opt/local/var/db/postgresql84/defaultdb -l /var/log/postgresql/postgresql.log"
alias pgstop="sudo -u postgres /opt/local/lib/postgresql84/bin/pg_ctl stop -D /opt/local/var/db/postgresql84/defaultdb"

# MySQL control
alias mysqlstart="sudo /opt/local/share/mysql5/mysql/mysql.server start && ln -s /opt/local/var/run/mysql5/mysqld.sock /tmp/mysql.sock"
alias mysqlstop="sudo /opt/local/share/mysql5/mysql/mysql.server stop; unlink /tmp/mysql.sock"

# Quicksilver
alias qsrestart="killall Quicksilver; open /Applications/Quicksilver.app"

# Rails shortcuts
alias ss='script/server'
alias sc='script/console'
alias sg='script/generate'
alias at='autotest'
alias as='autospec'
alias migrate='rake db:migrate && rake db:schema:dump && rake db:test:prepare'

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

# Single command to launch a Rails project
alias edit_rails='git fetch origin && itab autospec && itab tail -f log/test.log && itab tail -f log/development.log && itab script/server && mate .'

# Git helpers
alias grc='git rebase --continue'
alias mate_unmerged="git st | grep \"unmerged\|both modified\" | awk -F : '{print \$2}' | while read line; do mate \$line; done"

# Autocompletion for a bunch of stuff
if [ -f /opt/local/etc/bash_completion ]; then
  source /opt/local/etc/bash_completion
fi
if [ -f /opt/local/etc/bash_completion.d/git ]; then
  source /opt/local/etc/bash_completion.d/git
fi
complete -C ~/dotfiles/tab_completion/rake -o default rake
complete -C ~/dotfiles/tab_completion/capistrano -o default cap

# Go to the Projects folder, probably where I start most of my terminals
cd ~/Projects
