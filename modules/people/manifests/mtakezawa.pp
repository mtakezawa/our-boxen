class people::mtakezawa {

    ## osx
    #
    # Finder
    include osx::finder::unhide_library
    class osx::finder::show_all_files {
        include osx::finder
        boxen::osx_defaults { 'Show all files':
            user   => $::boxen_user,
            domain => 'com.apple.finder',
            key    => 'AppleShowAllFiles',
            value  => true,
            notify => Exec['killall Finder'];
        }
    }
    include osx::finder::show_all_files

    # zsh
    package {
      'zsh':
        install_options => [
          '--disable-etcdir'
        ]
    }
    file_line { 'add zsh to /etc/shells':
      path    => '/etc/shells',
      line    => "${boxen::config::homebrewdir}/bin/zsh",
      require => Package['zsh'],
      before  => Osx_chsh[$::luser];
    }
    osx_chsh { $::luser:
      shell   => "${boxen::config::homebrewdir}/bin/zsh";
    }

    include pgadmin3
    include sequel_pro
    include virtualbox
    include vagrant
    include dterm
    include sublime_text_2
    class { 'firefox':
      locale=> 'ja-JP-mac',
      version => '34.0.5'
    }
    include chrome
    include sourcetree
    include java
    include python
    include macvim
    include minecraft
    include vlc
    include skype
    include imagemagick
    include libtool
    include pcre
    include libpng
    include redis
    include mysql
    include php::5_5_13
    include php::fpm::5_5_13
    include php::5_4_29
    include php::fpm::5_4_29
    include php::5_3_28
    include php::fpm::5_3_28
    class { 'php::global':
      version => '5.5.13'
    }
    include php::composer
    include hipchat
    include docker
    include fig
    include xquartz
    include onepassword
    include nginx
    include appcleaner


    include iterm2::stable
    include iterm2::colors::solarized_light
    include iterm2::colors::solarized_dark


    # need directory `/usr/local/bin`.
    # https://github.com/caskroom/homebrew-cask/issues/4716
    # ```
    # $ sudo mkdir -p /usr/local/bin
    # $ sudo chown takezawa:staff /usr/local/bin
    # $ chmod u+rwx /usr/local/bin
    # ```
    include atom
    atom::package { 'linter': }
    atom::package { 'japanese-wrap': }
    atom::package { 'autocomplete-plus': }
    atom::package { 'script': }
    atom::package { 'git-log': }
    atom::package { 'git-plus': }
    atom::package { 'term2': }
    atom::package { 'vim-mode': }
    atom::package { 'ex-mode': }
    atom::package { 'tree-view': }
    atom::theme { 'monokai': }
    atom::theme { 'seti-ui': }

    ## via homebrew
    #
    homebrew::tap { 'homebrew/binary': }
    package {
        [
            'readline',                   # use for ruby compile
            'coreutils',                  # change mac command to like GNU Linux
            'tree',                       # linux tree cmd
            'ctags',                      # vim compel
            'tmux',                       # terminal session
            'tig',                        # git cui client
            'reattach-to-user-namespace', # use tmux to clipbord
            'packer',                     # vagrant box maker
            'graphviz',                   # graphviz
            'gts',                        # need for graphviz
            'libusb',                     # need for wine
            'libusb-compat',              # need for wine
            #'wine',                       # wine
            'elasticsearch'               # elasticksearch
        ]:
    }

    # http://support.apple.com/kb/DL1572
    package { 'JavaOsx':
        source  => 'http://support.apple.com/downloads/DL1572/en_US/JavaForOSX2014-001.dmg',
        provider => pkgdmg
    }

    package { 'ShareMouse':
        source => 'http://www.keyboard-and-mouse-sharing.com/ShareMouseSetup.dmg',
        provider => appdmg
    }

    package { 'kengingon1.1.2':
        source => 'http://www.nanayojapan.co.jp/file/38c5e777-b2ef-4434-8091-6290cb41fc16.dmg',
        provider => pkgdmg
    }

    package { 'ownCloud1.8.1':
        source => 'https://download.owncloud.com/desktop/stable/ownCloud-1.8.1.2335.pkg',
        provider => pkgdmg
    }

    #package { 'Hosts1.3':
    #    source => 'https://github.com/downloads/specialunderwear/Hosts.prefpane/Hosts-1.3.pkg',
    #    provider => pkgdmg
    #}

    package { 'DeltaWalker-2.1.1':
        source => 'https://s3.amazonaws.com/deltawalker/DeltaWalker-2.1.1_64.dmg',
        provider => appdmg
    }

    package { 'perfoce-r14.3':
        source => 'http://cdist2.perforce.com/perforce/r14.3/bin.macosx107x86_64/P4V.dmg',
        provider => appdmg
    }

    package { 'onedrive-for-business-client-preview':
        source => 'http://download.microsoft.com/download/D/9/8/D98389DB-5946-412C-A0A6-44808C19F99C/OneDriveForBusinessMacPreview.dmg',
        provider => pkgdmg
    }

    class { 'android::studio':
        release => '1.0.1',
        version => '1641136'
    }
    
    nodejs::module { 'titanium':
        node_version => 'v0.12.4'
    }
    nodejs::module { 'alloy':
        node_version => 'v0.12.4'
    }
    nodejs::module { 'less':
        node_version => 'v0.12'
    }
    nodejs::module { 'grunt-cli':
        node_version => 'v0.12'
    }
    nodejs::module { 'bower':
        node_version => 'v0.12'
    }

    # intellij
    class { 'intellij':
        edition => 'ultimate',
        version => '14.1.3'
    }

    #include vmware_fusion
    # vmaware fusion
    class { 'vmware_fusion':
        version => '7.0.0-2103067'
    }

    # android
    include android::sdk
    include android::ndk
    include android::tools
    include android::platform_tools
    # @see https://developer.android.com/tools/revisions/build-tools.html
    #android::build_tools { '21.1.1': }
    android::build_tools { '20.0.0': }
    include android::16
    include android::studio

    # skitch
    include skitch

    # mysql-workbench
    include mysql_workbench

}
