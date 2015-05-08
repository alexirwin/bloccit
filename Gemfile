source 'https://rubygems.org'
#import bootstrap css framework
gem 'bootstrap-sass'

###add figaro to secure environmental variables (API keys, passwords, etc.)
gem 'figaro', '1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# added 4//3/1 https://github.com/rweng/pry-rails#installation
gem 'pry-rails', :group => :development

# modified per bloc specs
group :production do
   gem 'pg'
   gem 'rails_12factor'
   #to correct error noted when pushing master to heroku
	##ruby '2.0.0'
end
# end bloc modification

#install redcarpet for markdown
gem 'redcarpet'

group :development do
   gem 'sqlite3'
 end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# added Faker to generate dev database entries on 04.03.2015
gem 'faker'

# adding devise for user authentication
gem 'devise'

# Adding Pundit for user roles/ authorization
gem 'pundit'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

