#tty-clock -c -C 1
# ENABLE DEL IN ST
tput smkx

# COLOURED MANPAGES
set -x LESS_TERMCAP_mb (printf "\033[01;31m")  
set -x LESS_TERMCAP_md (printf "\033[01;31m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")  
set -x LESS_TERMCAP_us (printf "\033[01;32m")

# START SSH AGENT
#if test -z "$SSH_ENV"
#    set -xg SSH_ENV $HOME/.ssh/environment
#end

#if not __ssh_agent_is_started
#    __ssh_agent_start
#end

# see also .bashrc!
alias print "lp"
alias config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
