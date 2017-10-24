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
export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/:$PATH"

# Use Sublime Text when possible
export VISUAL='subl -w'

