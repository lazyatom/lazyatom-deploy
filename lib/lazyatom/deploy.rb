require "freerange/deploy"
require "freerange/puppet"

Capistrano::Configuration.instance(:must_exist).load do
  set :user, `whoami`.strip
  set :group, 'application'

  set :puppet_user, 'root'
  set :puppet_os, 'ubuntu'
end