
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
# http://superuser.com/questions/137438/how-to-unlimited-bash-shell-history
# https://www.kernel.org/doc/man-pages/online/pages/man3/strftime.3.html
export HISTCONTROL=ignoredups:erasedups  # No duplicate entries.
export HISTSIZE=10000                    # Big BIG history.
export HISTFILESIZE=10000                # Big BIG history.
export HISTTIMEFORMAT="%a %h %d - %r "   # Timestamp.
shopt -s histappend                      # Append to history, don't overwrite it.
# Save and reload the history after each command finishes:
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# kubectl and autocomplete for gcloud commands
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
