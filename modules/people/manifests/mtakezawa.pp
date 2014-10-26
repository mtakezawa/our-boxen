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
    #include firefox
    include chrome
    #include dropbox
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
    #include php::5_4
    include hipchat
    include docker
    include fig
    include xquartz
    include onepassword

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
            'freetype',                   # need for wine
            'jpeg',                       # need for wine
            'libusb',                     # need for wine
            'libusb-compat',              # need for wine
            #'wine',                       # wine
            'elasticsearch'               # elasticksearch
        ]:
    }

    # http://support.apple.com/kb/DL1572
    package { 'JavaOsx':
        source  => 'http://support.apple.com/downloads/DL1572/en_US/JavaForOSX2014-001.dmg',
        provider => pkgdmg;
    }

    package { 'AppCleaner':
        source   => 'http://www.freemacsoft.net/downloads/AppCleaner_2.2.3.zip',
        provider => 'compressed_app'
    }

    homebrew::tap { 'sanemat/font': }
    # TODO
    # これだとエラーになる。 20140704 時点
    # brew reinstall --powerline --vim-powerline ricty
    # でインストール出来る。
    # @see http://qiita.com/znz/items/e94b7377f201e7b1683e
    # @see https://github.com/sangotaro/my-boxen/blob/d462764e9eee85bbe4641d1accfc4fd5f86076eb/modules/people/manifests/sangotaro.pp
    #
    # /opt/boxen/homebrew/Cellar/ricty/3.2.3/share/fonts 
    # にビルドされた ricty をインストールする。
    #package { 'ricty': }

    nodejs::module {
        'titanium':
            node_version => 'v0.10'
    } 

    nodejs::module {
        'alloy':
            node_version => 'v0.10'
    } 

    nodejs::module {
        'less':
            node_version => 'v0.10'
    } 

    # intellij
    class { 'intellij':
        edition => 'ultimate',
        version => '13.1.5'
    }
    
    # vmaware fusion
    #class { 'vmware_fusion':
    #    version => '5.0.4-1435862'
    #}
}
