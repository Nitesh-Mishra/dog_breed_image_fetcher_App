# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.17.3'

set :application, 'dog_breed_image_app'
set :repo_url, 'git@github.com:Nitesh-Mishra/dog_breed_image_fetcher_App.git'

set :rvm_ruby_version, '3.1.4'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/ubuntu/node_modules/bin/dog_breed_image_app'
set :base_path, '/home/ubuntu/node_modules/bin'

set :puma_threads, [2, 3]
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_phased_restart, true
set :puma_user, 'ubuntu'

# Default value for :pty is false
# set :pty, true
set :pty, false

set :puma_systemctl_user, :systemd

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'
append(
  :linked_files,
  'config/puma.rb',
  'config/credentials/production.key'
)

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
