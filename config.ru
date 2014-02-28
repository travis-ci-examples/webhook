require 'bundler'
Bundler.setup

require 'sinatra'
require 'json'
require 'digest/sha2'

$stdout.sync = true
class TravisWebhook < Sinatra::Base
  set :token, ENV['TRAVIS_USER_TOKEN']

  post '/' do
    if not valid_request?
      puts "Invalid payload request for repository #{repo_slug}"
    else
      payload = JSON.parse(params[:payload])
      puts "Received valid payload"
    end
  end

  def valid_request?
    digest = Digest::SHA2.new.update("#{repo_slug}#{settings.token}")
    digest.to_s == authorization
  end

  def authorization
    env['HTTP_AUTHORIZATION']
  end

  def repo_slug
    env['HTTP_TRAVIS_REPO_SLUG']
  end
end

run TravisWebhook
