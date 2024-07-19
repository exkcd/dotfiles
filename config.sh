#!/usr/bin/sh

# Credit to https://github.com/mdo/config

# Close any open System Preferences panes, to prevent them from overriding
# changed settings

osascript -e 'tell application "System Preferences" to quit'

# Ask for the admin password
sudo -v

# Keep-alive: update existing `sudo` time stamp until script is finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#
# Color key
#

red=$'\e[1;31m'
green=$'\e[1;32m'
yellow=$'\e[1;33m'
blue=$'\e[1;34m'
magenta=$'\e[1;35m'
cyan=$'\e[1;36m'
end=$'\e[0m'

#
# Copying dotfiles
#

# printf "%s\n# Copying dotfiles...\n%s" $yellow $end
#    curl https://raw.githubusercontent.com/exkcd/config/main/ >

#
# macOS preferences
#

printf "%s\n# Adjusting macOS...\n%s" $yellow $end
{
    # Dock
    #
    # System Preferences > Dock > Automatically hide and show the Dock:
    defaults write com.apple.dock autohide -bool true
    # System Preferences > Dock > Size:
    defaults write com.apple.dock tilesize -int 36
    # System Preferences > Mission Control > Automatically rearrange Spaces based on most recent use
    defaults write com.apple.dock mru-spaces -bool false
    # Clear out the dock of default icons
    defaults delete com.apple.dock persistent-apps
    defaults delete com.apple.dock persistent-others
    # Don't show recent applications in Dock
    defaults write com.apple.doc show-recents -bool false

    # Finder
    #
    # Hide desktop icons
    defaults write com.apple.finder CreateDesktop false
    # View as columns
    defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
    # Show path bar
    defaults write com.apple.finder ShowPathbar -bool true
    # Show status bar
    defaults write com.apple.finder ShowStatusBar -bool true
    # When performing a search, search current folder by default
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
    # Prevents .DS_Store files
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    # Set desktop as default location for new Finder windows
    defaults write com.apple.finder NewWindowTarget -string "PfDe"


    # System Preferences
    #
    # Disable LCD font smoothing (default 4)
    defaults -currentHost write -globalDomain AppleFontSmoothing -int 0
    # Require password immediately after sleep or screen saver begins
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswodDelay -int 0
    # Disable keyboard autocorrect
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
    # Show battery percentage in menu bar
    defaults write com.apple.menuextra.battery ShowPercent -string "YES"

    # Terminal
    #
    # Disable line marks
    defaults write com.apple.Terminal ShowLineMarks -int 0
    # Stop terminal from saving zsh sessions
    defaults write com.apple.Terminal NSQuitAlwaysKeepsWindows -bool false

    # Restart Finder and Dock (some changes might need a restart)
    killall Finder
    killall Dock

} &> /dev/null

printf "%sDone!%s" $green $end

#
# Additonal dependencies
#

printf "%s\n# Installing additional dependencies...\n%s" $yellow $end

# Install Oh My Zsh
printf "%s\n# Oh My Zsh:\n%s" $yellow $end

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Homebrew
printf "%s\n# Homebrew:\n%s" $yellow $end

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

printf "%s - Done!\n%s" $green $end

# Formulae and casks
printf "%s\n# Installing formulae and casks... \n%s" $green $end

brew bundle

# Cleanup everything
brew doctor
brew cleanup

printf "%s\nHeck yeah, all done! \n%s" $green $end
