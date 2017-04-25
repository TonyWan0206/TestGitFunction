# config valid only for current version of Capistrano
lock "3.8.0"

set :stages, ["production"]
set :default_stage, "production"

set :application, "TestGitCap"
set :repo_url, "git@github.com:TonyWan0206/TestGitFunction.git"
set :user, "tony.wan@sportshouse.com.hk"

#set :default_env, { path: "C:\\Working\\TestGitFunction" }

set :branch, "master"
set :deploy_to, "C:\\TestDeploy"
#set :current_path, "C:\\Working\\TestGitFunction"
 
 
 
 
 require 'capistrano/ext/windows_server'

set :rails_env, 'production'
set :user, 'git'
set :mongrel_instances, (1..3)                                          # Create 3 mongrel instances
set :mongrel_instance_prefix, 'mongrel_'                                #  named mongrel_{1..3}
set :bundler_git_command, '/cygdrive/c/RailsInstaller/Git/bin/git.exe'  # Specify the remote location of a Windows installation of git
 
 
#set :password, ask('Server password:', nil)
#server 'localhost', user: 'TonyW', port: 22, password: fetch(:password), roles: %w{web app db}
server 'localhost', user: 'tony', port: 22, password:"123", roles: %w{web app}
 set :use_sudo, true

#role :web, :target_server
#role :app, :target_server
#role :db , :target_server

before :deploy, :before_deploy
after :deploy, :after_finishing
#before :deploy, :before_deploy2

task :before_deploy do
	run_locally do
	#on roles(:app) do
		execute "dir "
		execute "cd " + deploy_to
		execute "cd ./ "
		#execute "echo " + deploy_to
	end
end



task :after_finishing do
	run_locally do
		execute "echo " + deploy_to
	end
end

 append :linked_files, "config/database.yml"#, "config/secrets.yml"
set :keep_releases, 5

 #task :before_deploy2 do
#	run_locally do
#		execute "echo Testing"
#	end
#end


#before :deploy, :deploy_from_local_repo
#
#  task :deploy_from_local_repo do
#    run_locally do
#	execute "tar -zcvf /tmp/repo.tgz .git"
#    end
#    on roles(:all) do
#      upload! '/tmp/repo.tgz', '/tmp/repo.tgz'
#      execute 'tar -zxvf /tmp/repo.tgz -C /tmp'
#    end
#  end
#

  

#set :linked_dirs, %w{my_shared_directory} 

#after "deploy:updated", "deploy:print_server_name"		

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"


# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
#set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"#, "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
