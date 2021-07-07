# Install all OS updates
/usr/bin/sudo /usr/sbin/softwareupdate -i -a

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Mac App Store command line tool ( used by the next step )
brew install mas

# Install everything listed in Brewfile
# See https://github.com/Homebrew/homebrew-bundle
brew bundle 

# Accept Xcode license
sudo xcodebuild -license accept

# Install Kubernetes command line client
gcloud components install kubectl

# Install j2 for our Kubernetes templates
# use pip or pip2 or other version of pip if pip3 is not working
pip3 install j2cli PyYAML

# Convenient git alias
git config --global alias.up 'pull --rebase --autostash'

# since Mac OS Catalina one needs to run this to run programs from unverified developers
# https://www.imore.com/how-open-apps-anywhere-macos-catalina-and-mojave
sudo spctl --master-disable

# now manual things
# login to all installed apps where applicable
# make sure the following is accessible to user: ~/Library/Application Support/Google/Chrome
# install Microsoft Office via 365 - download from 365 website
# set up git credentials
# System Preferences > Mission Control > uncheck Automatically rearrange spaces based on most recent use
# disable annoying jumping icons on the dock panel:
# System Preferences > Dock > uncheck Animate opening applications

# iTerm2
# inspired by: https://chamikakasun.medium.com/iterm2-zsh-oh-my-zsh-the-most-power-full-terminal-on-macos-2021-guide-macos-big-sur-5bb498976dc9
# ZSH
# check if installed
zsh --version
# if not, brew it
brew install zsh
# oh-my-zsh
# follow instructions here: https://ohmyz.sh/#install
# auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# in ~/.zshrc, add it as plugin, for example:
# plugins=(git zsh-autosuggestions)
# syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
# install nice theme: Powerlevel10k
# https://github.com/romkatv/powerlevel10k#get-started
# and then open the terminal and go through setup
# infinite scrollback
# Navbar -> Profiles -> Open Profiles... -> right-click -> Edit profile -> Terminal -> Unlimited Scrollback
# shortcuts
# enable Option+left, Option+right, Option+Delete, Option+fn+Delete
# https://apple.stackexchange.com/a/204802

# workspaces and hotkeys
# open fullscreen Evernote as first desktop
# System Preferences > Keyboard > Shortcuts > Mission Control > set Switch to Desktop X to ^(X+1)

# disable Mac double-space period
# Keyboard -> Text -> untick Add period with double-space

# disable Mac force click
# Trackpad -> Point & Click -> untick Force Click and Haptic Feedback

# remove Siri from touch bar
# Keyboard -> Customize control strip -> drag something less harmful (like screenshot) over Siri

# Input Sources
# Add U.S., Russian and Slovak - QWERTY
# System Preferences > Keyboard > Input Sources
# enable shortcut ^Space to change input source
# System Preferences > Keyboard > Shortcuts > Input Sources

# launch script
# Set launch.scpt to launch on startup
# Users & Groups > Login Items > add launch.applescript

# Alfred
# set up shortcuts to move to full-screen apps as if they were Spaces
# alternatively, just import Calendar.alfredworkflow
# get these workflows
# https://github.com/zenorocha/alfred-workflows
# https://github.com/untoldwind/alfred2-layout
# https://github.com/haidersabri/alfred2-crunchbase-workflow
# set up iTerm2 as default console https://github.com/stuartcryan/custom-iterm-applescripts-for-alfred

# 1Password
# if the desktop app is throwing "1Password can’t create a required support file" modals, try:
# https://support.1password.com/cs/native-messaging-chown/
# and if not even that works:
# https://discussions.agilebits.com/discussion/comment/382174/#Comment_382174

# Little Snitch
# requires running the downloaded dmg, something like:
# /usr/local/Caskroom/little-snitch/4.5.1/LittleSnitch-4.5.1.dmg
# also, due to permissions, might be easier to copy somewhere and then run

# Sublime Text (3)
# enter license key in Sublime Text
# set User preferences in Sublime Text to attached file
# install package controll
# https://packagecontrol.io/installation
# install Babel package
# cmd+shift+p -> Package Controll: Install Package -> Babel
# install TypeScript package
# https://stackoverflow.com/a/47053967
# cmd+shift+p -> Package Controll: Install Package -> TypeScript

# VSCode
# Disable telemetry
# https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-telemetry-reporting
# Code > Preferences > Settings > search for telemetry, uncheck Telemetry: Enable Telemetry
# Disable crash reporting
# https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-crash-reporting
# Code > Preferences > Settings > search for crash, uncheck Telemetry: Enable Crash Reporter
# Install Sublime text key mapping extension
# Code > Preferences > Extensions > search for sublime > install

# XCode setup
# Menu -> Preferences -> Accounts
#  transfer credentials from old computer: https://apple.stackexchange.com/questions/57059/how-do-i-transfer-my-ios-developer-profile-to-another-computer
#  then (also here) log in to that profile

# git
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -C "tom.halgas@gmail.com"
ssh-keygen -t ed25519 -C "tom@sphere.me"
cd -
# now add the above ssh keys to GitHub and Sphere GitLab, respectively

# node
# first we need to clean up preexisting node and npm links
# https://stackoverflow.com/a/11178106
rm /usr/local/bin/node /usr/local/bin/npm
sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}
# install n
# https://github.com/tj/n
# note that originally it's for bash, not zsh
curl -L https://git.io/n-install | zsh
. /Users/tomash/.zshrc
# create a symlink - for react-native compilation in XCode
ln -s $(which node) /usr/local/bin/node

# mysql
# And MySQL 5.7.8 or greater, which also needs some setup. 
# Replace VERSION with your MySQL version and username with your computer username and the following script should work - though it rarely does:
# Copy launch agent into place
mkdir -p ~/Library/LaunchAgents && cp /usr/local/Cellar/mysql/VERSION/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/
# Inject launch agent
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
# Set up databases to run as your user account
# the following failed for me, but somehow the following steps still manage
mysqld --initialize --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql
# change the username to your computer username to grant yourself full access:
mysql -u root -p -e "CREATE USER 'tomash'@'localhost';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON * . * TO 'tomash'@'localhost';"

# redis
# https://medium.com/@petehouston/install-and-config-redis-on-mac-os-x-via-homebrew-eb8df9a4f298
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
# check
redis-cli ping

# react-native
npm install -g react-native-cli

# gcloud
gcloud init
# add more accounts
gcloud auth login
# check
gcloud auth list
# get cloud_sql_proxy
# https://cloud.google.com/sql/docs/mysql/sql-proxy
curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
chmod +x cloud_sql_proxy

# Go lang
# https://golang.org/doc/code.html
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
# https://stackoverflow.com/a/32357023
mkdir ~/go/bin
export GOBIN=$GOPATH/bin

# Bear
# Enable markdown compatibility mode in settings so that hyphens do not show as task boxes
