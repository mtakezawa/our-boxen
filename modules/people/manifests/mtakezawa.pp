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
    include php::5_4_18
    include php::fpm::5_4_18
    #include php::5_3_28
    #include php::fpm::5_3_28
    class { 'php::global':
      version => '5.4.18'
    }
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

    package { 'ownCloud1.7.1':
        source => 'https://download.owncloud.com/desktop/stable/ownCloud-1.7.1.1655.pkg',
        provider => pkgdmg
    }

    #package { 'Hosts1.3':
    #    source => 'https://github.com/downloads/specialunderwear/Hosts.prefpane/Hosts-1.3.pkg',
    #    provider => pkgdmg
    #}

    nodejs::module { 'titanium':
        node_version => 'v0.10'
    }
    nodejs::module { 'alloy':
        node_version => 'v0.10'
    }
    nodejs::module { 'less':
        node_version => 'v0.10'
    }
    nodejs::module { 'grunt-cli':
        node_version => 'v0.10'
    }
    nodejs::module { 'bower':
        node_version => 'v0.10'
    }

    # intellij
    class { 'intellij':
        edition => 'ultimate',
        version => '14.0.2'
    }

    #include vmware_fusion
    # vmaware fusion
    class { 'vmware_fusion':
        version => '7.0.0-2103067'
    }
}
