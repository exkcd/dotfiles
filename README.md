# Config

This is a basic checklist for the system prefernces that makes my macOS experience just a tad bit better.

Most of the customizations were taken from (https://github.com/mdo/config)

## Checklist

### Prep OS X

* Install `xcode` command line tools using `xcode-select --install`

* Use the following command to run the `config.sh` file in Terminal

```zsh
curl https://raw.githubusercontent.com/exkcd/config/main/config.sh > ~/Downloads/config.sh && zsh ~/Downloads/config.sh
```


### Updating the Terminal experience

The macOS terminal kinda sucks. To get around that, I customize my terminal experience to create a more efficient workflow.


#### Oh My Zsh

* I primarly use zsh as my shell langauge of choice.

* Use the following command to install 'Oh My Zsh'

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


#### Powerline10k for iTerm2

* Once that has been installed, I usually install `powerlevel10k` which can be installed via the following command

```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
* After installation go into the `.config` folder located in your primary user's directory and set `ZSH_THEME="powerlevel10k/powerlevel10k"`.


#### Tmux config checklist

* Install tpm (tmux plugin manager, changes color scheme, install additional plugins, etc.)
* Add the modified `.tmux.conf` to your user home directory
* Reload using `<prefix>I`


### Homebrew formulae and casks

In the `Brewfile` there are all the formulae and casks that I frequently use. Some more "case-by-case" casks are left out.


### Other applicaitons

* Adobe Lightroom (I edit photos for a hobby, definitely not required)

* [BananaBin app](https://bananabin.app/) (It's a cute little trash can app that creates flies circling around the trash after a certain byte limit)

* [Homerow](https://www.homerow.app/) (Keyboard shortcuts for macOS. It sadly costs $50 for installation, but the license is guaranteed until the Sun explodes)

* Microsoft Office apps (A perk of being in uni)

* Zoom (Kinda necessary for university students, unfortunately)


## Usage

It works for me, but if it doesn't work for you, I'm sorry.
