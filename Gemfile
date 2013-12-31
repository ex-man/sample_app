source 'https://rubygems.org'
ruby '1.9.3'
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.0.0'
gem 'bootstrap-sass', '2.3.2.0'
# try making bcrypt work
#gem 'rake-compiler', '~> 0.9.2'
#gem "rdoc", "~> 3.12.2"
#gem "rspec", "~> 2.14.1"
# end of extra things
gem 'bcrypt-ruby', "~> 3.1.2" #git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'

#alternative - maybe use somewhere else...
#gem "salt-and-pepper"

#gem 'pg', '0.15.1'

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.14.0'
	gem 'annotate', '2.4.0'			# this allows me to call 'bundel exec annotate --position before' to document model elements in the database
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
	gem 'factory_girl_rails', '4.2.1'
end

gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end