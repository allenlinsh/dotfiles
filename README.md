# :paperclip: Nothing but dotfiles
## Installation
### Create a config folder
```
cd ~ && mkdir -p .config && cd .config
```

### Set up repo (must install git)
```
git init && git branch -m main && git remote add origin https://github.com/allenlinsh/dotfiles.git && git fetch
```

### Install packages and plugins
```
./install.sh
```

### Install nerd fonts
Go to chrome-untrusted://crosh/html/nassh_preferences_editor.html

Initial Color Palette
```
[
  "#262626",
  "#EB3800",
  "hsla(130, 55%, 41%, 1)",
  "hsla(26, 99%, 53%, 1)",
  "hsla(211, 78%, 51%, 1)",
  "#DB3DFF",
  "#00A3A3",
  "#FFFFFF",
  "#D6D6D6",
  "hsla(356, 93%, 65%, 1)",
  "hsla(102, 80%, 69%, 1)",
  "hsla(40, 100%, 63%, 1)",
  "hsla(217, 100%, 90%, 1)",
  "#F4B5FB",
  "hsla(179, 72%, 58%, 1)",
  "#F8F9FA"
]
```

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
