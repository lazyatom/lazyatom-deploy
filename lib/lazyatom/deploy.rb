require "freerange/deploy"
require "freerange/puppet"

Capistrano::Configuration.instance(:must_exist).load do
  set :user, `whoami`.strip
  set :group, 'application'

  set :puppet_user, 'root'
  set :puppet_os, 'ubuntu'
  
  namespace :puppet do
    task :upload_lazyatom_app_modules do
      with_puppet_user do
        upload File.expand_path("../../../puppet", __FILE__), puppet_app_modules_path
      end
    end
  end

  after "puppet:upload_app_modules", "puppet:upload_lazyatom_app_modules"
end