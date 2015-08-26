# Reset
OFF='\e[0m';       # Text Reset

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Regular Colors
Black='\e[0;30m';        # Black
Red='\e[0;31m';          # Red
Green='\e[0;32m';        # Green
Yellow='\e[0;33m';       # Yellow
Blue='\e[0;34m';         # Blue
Purple='\e[0;35m';       # Purple
Cyan='\e[0;36m';         # Cyan
White='\e[0;37m';        # White

export PS1="\[$Cyan\]\u\[$OFF\]@\[$Green\]\h:\[$Yellow\]\w \[$OFF\]¢ ";
# export PS1="\[$Red\]\u\[$OFF\]@\[$Green\]\h:\[$Yellow\]\w \[$OFF\]\[$BRed\](warning!) \[$Red\]#\[$OFF\] ";

export CLICOLOR=1;
export LSCOLORS=ExFxBxDxCxegedabagacad;

# Editor
export EDITOR=vim;

# Aliases
alias ls='ls --color';
alias l='clear;ls -l'
alias la='clear;ls -Al';
alias grep='grep --color=auto';
alias search='la | grep';
alias edit='$EDITOR ~/.bash_profile';
alias back='cd ..; la';

# Git aliases
alias gis='git status';
alias gic='git checkout';
alias gib='git branch';
alias gif='git diff';
alias commit='git add .; git commit -m ';

# funcs
cs() { cd "$1" && la; }

push() {
	remote="origin";
	branch="master";

	if [[ -n "$1" ]]; then
		if [[ "$1" -ne "_" ]]; then
			remote=$1
		fi
	fi

	if [[ -n "$2" ]]; then
		branch=$2
	fi

	echo "git push -u "$remote" "$branch" --tags";
	git push -u $remote $branch --tags;
}
pull() {
	remote="origin";
	branch="master";

	if [[ -n "$1" ]]; then
		if [[ "$1" -ne "_" ]]; then
			remote=$1
		fi
	fi

	if [ $2 ]; then
		branch=$2
	fi

	echo "git pull "$remote" "$branch" --tags";
	git pull $remote $branch --tags;
}
