# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
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

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.11.0"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.7.92"
github "go",          "2.1.0"
github "homebrew",    "1.13.0"
github "hub",         "1.4.1"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.6.0"
github "nodejs",      "5.0.2"
github "openssl",     "1.0.0"
github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.3"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
#github "osx",               "2.7.1"
github "osx",               "2.1.0"

# browser
github "wget",              "1.0.0"
github "firefox",           "1.1.7"
github "chrome",            "1.1.2"

# virtual machine
github "vagrant",           "3.3.4"
github "virtualbox",        "1.0.13"
github "vmware_fusion",     "1.2.0"
github "docker",            "0.6.0"
github "fig",               "1.0.0"

# terminal
github "iterm2",            "1.2.2"
github "dterm",             "1.0.2"

# lib
github "imagemagick",       "1.2.1"
github "libtool",           "1.0.0"
github "pcre",              "1.0.0"
github "libpng",            "1.0.0"
github "autoconf",          "1.0.0"

# database
github "mysql",             "2.0.1"
github "elasticsearch",     "2.8.0"
github "redis",             "3.1.0"
github "pgadmin3",          "1.0.0"
github "sequel_pro",        "1.0.1"

# editor
github "sublime_text_2",    "1.1.2"
github "macvim",            "1.0.0"
github "intellij",          "1.5.1"
github "atom",              "1.2.0"

# vcs
github "sourcetree",        "1.0.0"

# language
github "java",              "1.7.1"
github "python",            "2.0.1"
github "php",               "1.2.4"

# game
github "minecraft",         "1.0.2"

# media
github "vlc",               "1.0.5"

# tool
github "dropbox",           "1.1.2"
github "skype",             "1.1.0"
github "hipchat",           "1.1.3"
github "onepassword",       "1.1.5"
github "appcleaner",        "1.0.0"
github "android",           "1.4.0"
github "skitch",            "1.0.3"
github "graphviz",          "1.0.0"

# 
github "mysql_workbench",   "1.0.0", :repo => "cdburgess/puppet-mysql_workbench"
