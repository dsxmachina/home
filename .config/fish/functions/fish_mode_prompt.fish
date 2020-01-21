function fish_mode_prompt
   # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold red
                echo [n]
            case insert
                set_color normal
                #echo [i]
            case replace_one
                set_color --bold green
                echo [r]
            case visual
                set_color blue
                echo [v]
        end
        set_color normal
    end
end
