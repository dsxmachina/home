function fish_prompt
    # https://stackoverflow.com/questions/24581793/ps1-prompt-in-fish-friendly-interactive-shell-show-git-branch
#    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    set -l git_status (git status --porcelain | grep 'M ')
    set_color normal
    echo -n (whoami)'@'(hostname)':'
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    if [ -n "$git_status" ] 
        set_color --bold red
    	#printf "\u25a0"
	#printf " \U25CF"
	printf "+"
    else
        set_color --bold green
	#printf " \U25CF"
	printf " "
    end
    set_color normal
    echo -n '> '
end

