# APP_NAME
Make Your Own Emblem

# How I did it
1. Heroku sign up
2. Heroku Toolbelt
3. HomebrewからRuby,Railsインストールまではこちら参照。
http://qiita.com/shu_0115/items/72305bff6a1318769e0a
4. Append some usuful Gems, and "bundle"
gem 'haml-rails'
gem 'minimum-omniauth-scaffold'
gem 'action_args'
gem 'html5_validators'
gem 'puma'
gem 'kaminari'
gem 'rails_config', '~> 0.4.2'
gem 'tapp'
gem 'awesome_print'
gem "exception_notification", "~> 4.0.0.rc1"
gem 'i18n_generators'
gem 'cloudinary'
gem 'config'

group :development do
  gem 'pry-rails'
  gem "rails-erd"
  gem 'binding_of_caller'
  gem "erb2haml"
  gem 'quiet_assets'
  gem 'taps'
  gem 'rvm'

end

group :development, :test do
  gem 'rspec-rails'
end

group :production do
  gem 'thin'
  gem 'rails_12factor'
  gem 'pg'
  gem 'newrelic_rpm'
end

rails new appname
rails generate controller hello index
rails g scaffold item name:string price:integer description:textpwd
git add . -A
git commit -m "initial"

 # Use sqlite3 as the database for Active Record
 gem 'sqlite3', :group => [:development, :test]
 gem 'pg', :group => [:production]
 gem 'rails_12factor', :group => [:production]

4. Use minimum-omniauth-scaffold For social authentications
 ## Enroll Twitter, Facebook developer account and App
 ## Configure uid, usersecret
 ## rails g minimum:omniauth:scaffold
 Here's detail:http://morizyun.github.io/blog/minimum-omniauth-scaffold/

5. Use cloudinary for photo editing
 Uploading image should be on Social call back routine.
 Editing photo is in view file.
 Details:http://cloudinary.com/documentation/rails_image_manipulation

6. Submit git and Migrate Heroku
git commit -a -m "edit Gemfile3"
git push heroku master
heroku run rake db:migrate

