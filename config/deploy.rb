require "bundler/capistrano"
require "gitshapage"

set :use_sudo, false
set :user, "reflector"

set :application, "reflector"
set :deploy_to, "/home/#{user}/#{application}"

set :scm, :git
set :repository,  "git@github.com:username/repository.git"

role :web, "website.example.com"
role :app, "website.example.com"
role :db, "website.example.com"

set :normalize_asset_timestamps, false

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :migrate do
    run "cd #{deploy_to}/current && bundle exec padrino rake dm:migrate -e production"
  end
  task :seed do
    run "cd #{deploy_to}/current && bundle exec padrino rake seed -e production"
  end
end