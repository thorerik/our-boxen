class people::thorerik {

    notify { 'class people::thorerik declared': }

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

    include python
    include zsh
    include firefox
    include tmux
    include vmware_fusion
    include phpstorm
    include better_touch_tools
    include chrome
    include java
    include iterm2::dev
    include dropbox
    include alfred
    include skype
    include spotify
    include steam
    include nmap
    include sublime_text
    include atom
    include wget
    include crashplan
    include skydrive
    include caffeine
    include textmate
    include teamviewer


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

    exec { "install-spf13-vim":
        command => "curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh",
        creates => "${home}/.vimrc",
    }

    exec { "install-oh-my-zsh":
        command => "git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh",
        creates => "${home}/.oh-my-zsh",
    }

    exec { "link-zshrc":
        command => "ln -s ${dotfiles}/zshrc ${home}/.zshrc",
        creates => "${home}/.zshrc",
    }

    exec { "link-tmux.conf":
        command => "ln -s ${dotfiles}/tmux.conf ${home}/.tmux.conf",
        creates => "${home}/.tmux.conf"
    }

}
