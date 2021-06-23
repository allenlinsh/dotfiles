# :paperclip: Nothing but dotfiles
## Installation
### Create a config folder
```
cd ~ && mkdir .config && cd .config
```

### Set up repo (must install git)
```
git init && git remote add origin https://github.com/allenlinsh/dotfiles.git && git fetch && git checkout main
```

### Install packages and plugins
```
./install.sh
```

### Install nerd fonts
[chrome-untrusted://crosh/html/nassh_preferences_editor.html](chrome-untrusted://crosh/html/nassh_preferences_editor.html)
Custom CSS(URI)
```
https://cdn.jsdelivr.net/gh/wernight/powerline-web-fonts@ba4426c
```
Custom CSS (inline text)
```
@font-face {
    font-family: "Source Code Pro";
    src: url("https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf");
    font-weight: normal;
    font-style: normal;
}
```
