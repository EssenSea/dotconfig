#
# ~/.bashrc
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=10000
export HISTFILESIZE=500000
export HISTTIMEFORMAT="%F %T "
# alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ls="lsd"
alias ll="lsd -la"
alias la="lsd -a"
alias wget='wget -c '
alias hw='hwinfo --short'

alias untar='tar -zxvf '
# alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

git_branch() {
  branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
  if [ ! -z "$branch" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      color="31"  # Red for changes
    elif [ "$(git stash list)" ]; then
      color="33"  # Yellow for stashed changes
    else
      color="32"  # Green for a clean state
    fi
    echo -e "\\e[0;${color}m${branch}\\e[0m"  
  fi
}
function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

VENV="\$(virtualenv_info)";
# the '...' are for irrelevant info here.
# PS1="\[\e[0;31m\]  -<< \$(git_branch) \[\e[1;36m\]\u@\h \d \A \[\e[0;01m\]\W ${VENV} \[\e[0;31m\]>>- \n \[\e[0;31m\] >>-\[\e[1m\]:\[\e[0m\]"
PS1="\[\e[0;31m\] ++-<<+ \$(git_branch) \[\e[1;36m\]\u@\h \d \A \[\e[0;01m\]\W ${VENV}\[\e[0;31m\]+>>-++ \n \[\e[0;31m\]>>-++\[\e[1m\]:\[\e[0m\]"

source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash
eval "$(thefuck --alias)"
# eval "$(starship init bash)"
# Load starship prompt if starship is installed
# if  [ -x /usr/bin/starship ]; then
#     __main() {
#         local major="${BASH_VERSINFO[0]}"
#         local minor="${BASH_VERSINFO[1]}"
#
#         if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
#             source <("/usr/bin/starship" init bash --print-full-init)
#         else
#             source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
#         fi
#     }
#     __main
#     unset -f __main
# fi
#
#
PATH+=/usr/local/texlive/2024/bin/x86_64-linux
MANPATH+=/usr/local/texlive/2024/texmf-dist/doc/man
INFOPATH+=/usr/local/texlive/2024/texmf-dist/doc/info

# shellcheck shell=bash

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
__zoxide_oldpwd="$(__zoxide_pwd)"

function __zoxide_hook() {
    \builtin local -r retval="$?"
    \builtin local pwd_tmp
    pwd_tmp="$(__zoxide_pwd)"
    if [[ ${__zoxide_oldpwd} != "${pwd_tmp}" ]]; then
        __zoxide_oldpwd="${pwd_tmp}"
        \command zoxide add -- "${__zoxide_oldpwd}"
    fi
    return "${retval}"
}

# Initialize hook.
if [[ ${PROMPT_COMMAND:=} != *'__zoxide_hook'* ]]; then
    PROMPT_COMMAND="__zoxide_hook;${PROMPT_COMMAND#;}"
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ $# -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ $# -eq 1 && $1 == '-' ]]; then
        __zoxide_cd "${OLDPWD}"
    elif [[ $# -eq 1 && -d $1 ]]; then
        __zoxide_cd "$1"
    elif [[ $# -eq 2 && $1 == '--' ]]; then
        __zoxide_cd "$2"
    elif [[ ${@: -1} == "${__zoxide_z_prefix}"?* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@: -1}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin unalias z &>/dev/null || \builtin true
function z() {
    __zoxide_z "$@"
}

\builtin unalias zi &>/dev/null || \builtin true
function zi() {
    __zoxide_zi "$@"
}

# Load completions.
# - Bash 4.4+ is required to use `@Q`.
# - Completions require line editing. Since Bash supports only two modes of
#   line editing (`vim` and `emacs`), we check if either them is enabled.
# - Completions don't work on `dumb` terminals.
if [[ ${BASH_VERSINFO[0]:-0} -eq 4 && ${BASH_VERSINFO[1]:-0} -ge 4 || ${BASH_VERSINFO[0]:-0} -ge 5 ]] &&
    [[ :"${SHELLOPTS}": =~ :(vi|emacs): && ${TERM} != 'dumb' ]]; then
    # Use `printf '\e[5n'` to redraw line after fzf closes.
    \builtin bind '"\e[0n": redraw-current-line' &>/dev/null

    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        [[ ${#COMP_WORDS[@]} -eq $((COMP_CWORD + 1)) ]] || return

        # If there is only one argument, use `cd` completions.
        if [[ ${#COMP_WORDS[@]} -eq 2 ]]; then
            \builtin mapfile -t COMPREPLY < <(
                \builtin compgen -A directory -- "${COMP_WORDS[-1]}" || \builtin true
            )
        # If there is a space after the last word, use interactive selection.
        elif [[ -z ${COMP_WORDS[-1]} ]] && [[ ${COMP_WORDS[-2]} != "${__zoxide_z_prefix}"?* ]]; then
            \builtin local result
            # shellcheck disable=SC2312
            result="$(\command zoxide query --exclude "$(__zoxide_pwd)" --interactive -- "${COMP_WORDS[@]:1:${#COMP_WORDS[@]}-2}")" &&
                COMPREPLY=("${__zoxide_z_prefix}${result}/")
            \builtin printf '\e[5n'
        fi
    }

    \builtin complete -F __zoxide_z_complete -o filenames -- z
    \builtin complete -r zi &>/dev/null || \builtin true
fi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.bashrc):
#
eval "$(zoxide init bash)"

# export WLR_RENDERER_ALLOW_SOFTWARE=1
# export WLR_BACKENDS=headless
# export WLR_RENDERER=vulkan
eval "$(ssh-agent -s)" &
