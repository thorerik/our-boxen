class people::thorerik {
    
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
