class people::thorerik {
    def github(name, args)
        options ||= if args.last.is_a? Hash
        args.last
        else
        {}
        end

        if path = options.delete(:path)
            mod name, :path => path
        else
            version = args.first
            options[:repo] ||= "boxen/puppet-#{name}"
            mod name, version, :github_tarball => options[:repo]
        end
    end
    
    
    #Applications
    github "zsh"
    github "vim"
    github "firefox"
    github "phpstorm"
    github "vmware_fusion"
    github "better_touch_tools"
    github "chrome"
    github "java"
    github "iterm2"
    github "dropbox"
    github "alfred"
    github "skype"
    github "spotify"
    github "steam"
    github "notanional_velocity"
    github "nmap"
    github "sublime_text"
    github "atom"
    github "wget"
    github "istatmenus4"
    github "mtr"
    github "crashplan"
    github "skydrive"
    github "caffeine"
    github "tmux"
    github "textmate"
    github "teamviewer"

    
    # Configuration modules
    github "include osx"
    
    include osx::global::disable_key_press_and_hold
    include osx::global::enable_keyboard_control_access
    include osx::global::expand_print_dialog
    include osx::global::expand_save_dialog
    include osx::global::disable_autocorrect

    include osx::dock::autohide

    include osx::finder::show_external_hard_drives_on_desktop
    include osx::finder::show_removable_media_on_desktop
    include osx::finder::unhide_library

    include osx::no_network_dsstores
    include osx::software_update
    include osx::keyboard::capslock_to_control



    $home     = "/Users/thor"
    $my       = "${home}/my"
    $dotfiles = "${my}/dotFiles"

    file { $my:
        ensure  => directory
    }

    repository { $dotfiles:
        source  => 'thorerik/dotFiles',
        require => File[$my]
    }



}
