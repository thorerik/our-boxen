class people::thorerik {
    #Applications
    include "zsh"
    include "vim"
    include "firefox"
    include "phpstorm"
    include "vmware_fusion"
    include "better_touch_tools"
    include "chrome"
    include "java"
    include "iterm2"
    include "dropbox"
    include "alfred"
    include "skype"
    include "spotify"
    include "steam"
    include "notanional_velocity"
    include "nmap"
    include "sublime_text"
    include "atom"
    include "wget"
    include "istatmenus4"
    include "mtr"
    include "crashplan"
    include "skydrive"
    include "caffeine"
    include "tmux"
    include "textmate"
    include "teamviewer"

    
    # Configuration modules
    include "include osx"
    
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
