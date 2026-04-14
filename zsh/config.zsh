export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export CLICOLOR=true
export JAVA_HOME="/Library/Java/JavaVirtualMachines/sapmachine-21.jdk/Contents/Home"
export PLATIN_JAVA="/Library/Java/JavaVirtualMachines/sapmachine-21.jdk/Contents/Home"
export PLUGIN_HOME="/Library/Java/JavaVirtualMachines/sapmachine-21.jdk/Contents/Home"

# Do not send data to $company. Sorry, not sorry.
export ADBLOCK=1
export AZURE_CORE_COLLECT_TELEMETRY=0
export DISABLE_OPENCOLLECTIVE=1
export DO_NOT_TRACK=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export ET_NO_TELEMETRY=0
export GATSBY_TELEMETRY_DISABLED=1
export HOMEBREW_NO_ANALYTICS=1
export NEXT_TELEMETRY_DISABLED=1
export OPEN_SOURCE_CONTRIBUTOR=1
export RIFF_DISABLE_TELEMETRY=1
export SAM_CLI_TELEMETRY=0
export STNOUPGRADE=1

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt auto_cd
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

PROMPT_GEOMETRY_GIT_CONFLICTS=true
PROMPT_GEOMETRY_GIT_TIME=false
GEOMETRY_SYMBOL_GIT_CONFLICTS_UNSOLVED="◇"
PROMPT_GEOMETRY_GIT_CONFLICTS=true
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Enable shift-select mode (Shift+Arrow to select text)
# Shift+Left/Right: select character by character
# Shift+Cmd+Left/Right (or Alt+Shift+Left/Right): select word by word
# Shift+Home/End: select to beginning/end of line
bindkey -e  # ensure emacs keymap is active (needed for shift-select)

# Enable the shift-select region highlight
zle_highlight=(region:standout)

# Define shift-select widgets
shift-select-left() {
  ((REGION_ACTIVE)) || zle set-mark-command
  zle backward-char
}
zle -N shift-select-left

shift-select-right() {
  ((REGION_ACTIVE)) || zle set-mark-command
  zle forward-char
}
zle -N shift-select-right

shift-select-word-left() {
  ((REGION_ACTIVE)) || zle set-mark-command
  zle backward-word
}
zle -N shift-select-word-left

shift-select-word-right() {
  ((REGION_ACTIVE)) || zle set-mark-command
  zle forward-word
}
zle -N shift-select-word-right

shift-select-begin-of-line() {
  ((REGION_ACTIVE)) || zle set-mark-command
  zle beginning-of-line
}
zle -N shift-select-begin-of-line

shift-select-end-of-line() {
  ((REGION_ACTIVE)) || zle set-mark-command
  zle end-of-line
}
zle -N shift-select-end-of-line

# Deactivate region on unshifted movement
deselect-and-left() { REGION_ACTIVE=0; zle backward-char; }
zle -N deselect-and-left
deselect-and-right() { REGION_ACTIVE=0; zle forward-char; }
zle -N deselect-and-right

# Bind Shift+Arrow keys
bindkey '\e[1;2D' shift-select-left           # Shift+Left
bindkey '\e[1;2C' shift-select-right          # Shift+Right
bindkey '\e[1;2A' up-line-or-beginning-search # Shift+Up (keep history search)
bindkey '\e[1;2B' down-line-or-beginning-search # Shift+Down

# Bind Shift+Cmd+Arrow (iTerm2 sends these as Shift+Alt sequences by default)
# Cmd+Shift+Left / Alt+Shift+Left: select word left
bindkey '\e[1;4D' shift-select-word-left      # Alt+Shift+Left
bindkey '\e[1;6D' shift-select-word-left      # Ctrl+Shift+Left
bindkey '\e[1;10D' shift-select-word-left     # Cmd+Shift+Left (some terminals)

# Cmd+Shift+Right / Alt+Shift+Right: select word right
bindkey '\e[1;4C' shift-select-word-right     # Alt+Shift+Right
bindkey '\e[1;6C' shift-select-word-right     # Ctrl+Shift+Right
bindkey '\e[1;10C' shift-select-word-right    # Cmd+Shift+Right (some terminals)

# Cmd+Shift+Left/Right for select to beginning/end of line
bindkey '\e[H' beginning-of-line              # Home
bindkey '\e[F' end-of-line                    # End
bindkey '\e[1;2H' shift-select-begin-of-line  # Shift+Home
bindkey '\e[1;2F' shift-select-end-of-line    # Shift+End

# Regular (unshifted) arrow keys deactivate selection
bindkey '\e[D' deselect-and-left              # Left
bindkey '\e[C' deselect-and-right             # Right

# Tell zsh-autosuggestions to treat our custom widgets like the originals.
# Must set full array (not +=) because this runs before the plugin loads;
# += would create the array early, causing the plugin to skip its defaults.
typeset -ga ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
  forward-char end-of-line vi-forward-char vi-end-of-line vi-add-eol
  deselect-and-right
)
typeset -ga ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
  forward-word emacs-forward-word vi-forward-word vi-forward-word-end
  vi-forward-blank-word vi-forward-blank-word-end vi-find-next-char
  vi-find-next-char-skip
  shift-select-word-right
)

# Restore arrow keys inside completion menu (menuselect keymap)
zmodload zsh/complist
bindkey -M menuselect '\e[D' backward-char          # Left
bindkey -M menuselect '\e[C' forward-char            # Right
bindkey -M menuselect '\e[A' up-line-or-history      # Up
bindkey -M menuselect '\e[B' down-line-or-history    # Down

