# bobthefish powerline setup
set -g theme_display_cmd_duration no
set -g theme_nerd_fonts yes
set -g theme_git_default_branches main
set -g theme_newline_cursor no
set -g theme_color_scheme dracula

# xkbcommon disable warning
set -x XKB_LOG_LEVEL critical

# global editor
set -gx EDITOR nvim
