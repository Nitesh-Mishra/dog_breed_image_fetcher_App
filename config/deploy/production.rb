# frozen_string_literal: true

role :web, ['43.205.0.20']
role :app, ['43.205.0.20']

set :ssh_options, {
  user: 'ubuntu',
  forward_agent: true,
  auth_methods: ['publickey'],
  keys: ['~/.ssh/new_ssh_key.pem']
}

set :branch, 'main'
# set :base_path, '/var/www/'
# set :deploy_to, '/var/www/dog_breed_image_app'

set :user, 'ubuntu'
set :scm_passphrase, ''
set :runner, 'ubuntu'

set :puma_workers, 2
