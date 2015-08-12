
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# sync - conf
export EDITOR=vim

# 
alias ls='ls --color';
alias l='clear;ls -l'
alias la='clear;ls -Al';
alias grep='grep --color=auto';
alias search='la | grep';
alias edit='$EDITOR ~/.bash_profile';
alias back='cd ..; la';

# git aliases
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
