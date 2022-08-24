# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="substance"

# Use certificates installed via Macports
SSL_CERT_FILE=/opt/local/share/curl/curl-ca-bundle.crt

setopt no_share_history

# Java (for Minecraft mods)
export GRADLE_HOME=/opt/local/share/java/gradle
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home/

# Use Python commands
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# Use VS Code when possible
export VISUAL='code --new-window --wait'

# asdf-vm for version managing all the things!
. $HOME/.asdf/asdf.sh
export PATH="~/.asdf/shims:$PATH"

plugins=(aws git gitfast git-prompt rvm sublime thefuck)

# Load secrets
[[ -f ~/.env.secrets ]] && source ~/.env.secrets
