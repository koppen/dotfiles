# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="substance"

# Use certificates installed via Macports
SSL_CERT_FILE=/opt/local/share/curl/curl-ca-bundle.crt

setopt no_share_history

# Configure Docker
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/jakob/.boot2docker/certs/boot2docker-vm

# Use Python commands
export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/:$PATH"

# Use Sublime Text when possible
export VISUAL='subl -w'

