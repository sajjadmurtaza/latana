# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'importmap-rails', '>= 0.9.2'
gem 'jbuilder', '~> 2.11'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.0.rc1'
gem 'redis', '~> 4.0'
gem 'sprockets-rails', '>= 3.4.1'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails', '>= 0.7.3'
gem 'turbo-rails', '>= 0.9.0'

gem 'bootstrap', '~> 5.1.3'
gem 'deb_control'
gem 'jquery-rails'
gem 'sidekiq'
gem 'sidekiq-scheduler'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', '>= 1.0.0', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop'
end

group :development do
  gem 'annotate'

  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0'
  gem 'webdrivers'
end
