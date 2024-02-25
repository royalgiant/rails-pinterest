# Ruby Pinterest

[![Gem Version](https://badge.fury.io/rb/ruby-openai.svg)](https://badge.fury.io/rb/rails-pinterest)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/royalgiant/rails-pinterest/blob/main/LICENSE.txt)

Use the [Pinterest API](https://developers.pinterest.com/docs/api/v5/) with Rails!

List, Get, Create, Update and Delete Pins, Boards, and Board Sections with Rails Pinterest API

🚢 Based in the US and want to hire me? Now you can! [Email Me](mailto:donaldlee50@gmail.com)

[🐦 Twitter](https://twitter.com/donaldlee50) | [▶️ Youtube](https://youtube.com/c/donaldklee) 

### Bundler

Add this line to your application's Gemfile:

```ruby
gem "rails-pinterest"
```

And then execute:

```bash
$ bundle install
```

### Gem install

Or install with:

```bash
$ gem install rails-pinterest
```

and require with:

```ruby
require "pinterest"
```

## Usage

- Get your API access from [https://developers.pinterest.com/apps/](https://developers.pinterest.com/apps/)
- After creating an app, click into the app to generate an access token
- Or for automated refreshing of tokens check out this [guide](https://developers.pinterest.com/docs/getting-started/authentication/) (this is done in your own app and is unavailable on the API)

### Quickstart

For a quick test you can pass your token directly to a new client:

```ruby
client = Pinterest::Client.new(access_token: "pina_access_token_goes_here")
```

### With Config

For a more robust setup, you can configure the gem with your API keys, for example in an `pinterest.rb` initializer file. Never hardcode secrets into your codebase - instead use something like [dotenv](https://github.com/motdotla/dotenv) to pass the keys safely into your environments.

```ruby
Pinterest.configure do |config|
    config.access_token = ENV.fetch("PINTEREST_ACCESS_TOKEN")
end
```
If you use Rails 7, you would probably store your key in credentials.yml, then you can do something like this:
```ruby
Pinterest.configure do |config|
    config.access_token = Rails.application.credentials[Rails.env.to_sym].dig(:pinterest, :api_key)
end
```

Then you can create a client like this:

```ruby
client = Pinterest::Client.new
```

You can still override the config defaults when making new clients; any options not included will fall back to any global config set with Pinterest.configure. e.g. in this example the uri_base, request_timeout, etc. will fallback to any set globally using Pinterest.configure, with only the access_token overridden:

```ruby
client = Pinterest::Client.new(access_token: "access_token_goes_here")
```

#### Custom timeout or base URI

The default timeout for any request using this library is 120 seconds. You can change that by passing a number of seconds to the `request_timeout` when initializing the client. You can also change the base URI used for all requests.

```ruby
client = Pinterest::Client.new(
    access_token: "access_token_goes_here",
    uri_base: "https://api.pinterest.com/",
    request_timeout: 240,
    extra_headers: {
      "accept" => "application/json",
      "content-type": "application/json",
    }
)
```

or when configuring the gem:

```ruby
Pinterest.configure do |config|
    config.access_token = ENV.fetch("PINTEREST_ACCESS_TOKEN") # Or Rails.application.credentials[Rails.env.to_sym].dig(:pinterest, :api_key) for Rails 7
    config.uri_base = "https://api.pinterest.com/",
    config.request_timeout = 240 # Optional
    config.extra_headers = {
      "accept" => "application/json",
      "content-type": "application/json",
    } # Optional
end
```
### Running in Console
Easily run tests in console with ```bin/console```

```ruby
# Examples

# Getting a board
client = Pinterest::Client.new(access_token: "your-access-token-here")
response = client.boards.get_boards

puts response
# => {"items"=>[{"description"=>"", "owner"=>{"username"=>"otakuweebcloset"}, "pin_count"=>18, "created_at"=>"2023-04-29T02:51:52", "name"=>"Studio Ghibli", "follower_count"=>38, "id"=>"996421554995231927", "privacy"=>"PUBLIC", "collaborator_count"=>1, "media"=>{"pin_thumbnail_urls"=>["https://i.pinimg.com/150x150/d2/62/89/d26289f4b7a6e416fad950d2852c4efd.jpg", "https://i.pinimg.com/150x150/d3/e5/56/d3e556ee6420375d1569b8bf4ed601d3.jpg", "https://i.pinimg.com/150x150/fc/76/6c/fc766c458b76bc4086c2f0a1516d8a72.jpg", "https://i.pinimg.com/150x150/83/8f/0b/838f0b7c5ede1b463c5308c82d36670f.jpg", "https://i.pinimg.com/150x150/b9/31/e9/b931e904ca48b2efcfc2b80fe8b3667e.jpg"], "image_cover_url"=>"https://i.pinimg.com/400x300/8b/32/30/8b3230e318f9ed950b6da24a727d4895.jpg"}, "board_pins_modified_at"=>"2023-06-20T16:00:18.116000"}], "bookmark"=>nil}

# Getting a pin
client.pins.get_pin(id: 996421486285872538)
# =>  {"board_owner"=>{"username"=>"otakuweebcloset"}, "created_at"=>"2023-05-03T04:45:05", "creative_type"=>"REGULAR",....

# Getting a list of board pins
client.boards.get_board_pins(id: 996421554995231927)
# => {"items"=>[{"description"=>"The full mystery is revealed in our....
```

### Boards

How to do simple get and post with boards

```ruby
# https://developers.pinterest.com/docs/api/v5/

# GET list of boards

response = client.boards.get_boards

# POST to create a board
parameters = {
    :name=>"give it some name", 
    :description=>"and a description"
}
response = client.pins.create_board(parameters: parameters)
```

### Pins

How to do simple get and post with pins

```ruby
# https://developers.pinterest.com/docs/api/v5/

# GET list of pins

response = client.pins.get_pin(id: 996421486285872538)

# POST to create a pin
parameters = {
    :board_id=>some_id, 
    :media_source=>{
        source_type: "image_url",
        url: "https://imagifyr.com/assets/home_logo-a52a3541ab2751e842ac524a7e20e85218d26732face6731494b87c32712eace.png",
    }   
}
response = client.pins.create_pin(parameters: parameters)

```

### Oauth

How to get exchange your authorization code for an access token [(step 3)](https://developers.pinterest.com/docs/getting-started/authentication/)
```ruby
# https://developers.pinterest.com/docs/getting-started/authentication/

# POST /oauth/tokens to exchange authorization code for access token

# 1. Build the client
client = Pinterest::Client.new(access_token: "fake-token-because-you-dont-have-this-yet", client_id: "client-id" , secret_key: "secret-key")

# 2. Build parameters
parameters = {
  'grant_type'    => 'authorization_code', # Required from Pinterest
  'code'          => params[:code].to_s, # Replace with the actual authorization code
  'redirect_uri'  => "your-redirect-uri"
}

# 3. Get the access token
response = client.oauth.retrieve_oauth_token(parameters: parameters)
puts response
# { "access_token": "{an access token string prefixed with 'pina'}", "refresh_token": "{a refresh token string prefixed with 'pinr'}", "response_type": "authorization_code", ..

```

How to refresh your access tokens

```ruby
# https://developers.pinterest.com/docs/api/v5/#tag/oauth

# POST /oauth/tokens to refresh tokens
parameters = {
    refresh_token: "your-refresh-token-goes-here", 
    grant_type: 'refresh_token' # Keep it as 'refresh_token' as per Pinterest API requirements
    scope: 'whatever-new-scopes-desired' #optional
}
response = client.oauth.retrieve_oauth_token(parameters: parameters)
puts response
# { "response_type": "refresh_token", "access_token": "string", "token_type": "bearer", "expires_in": 0, "scope": "string" }

```

Running the Oauth Refresh Token in Console
```ruby
# https://developers.pinterest.com/docs/api/v5/#tag/oauth

# 1. Create the client
client = Pinterest::Client.new(refresh_token: "your-refresh-token", access_token: "can-be-any-fake-or-real-token", client_id: 'client-id-or-app-id' , secret_key: "secret-key")

# 2. Set up the params
parameters = {
    refresh_token: "your-refresh-token-goes-here", 
    grant_type: 'refresh_token' # Keep it as 'refresh_token' as per Pinterest API requirements
    scope: 'whatever-new-scopes-desired' #optional
}

# 3. Retrieve refreshed access_token
response = client.oauth.retrieve_oauth_token(parameters: parameters)
puts response
# { "response_type": "refresh_token", "access_token": "string", "token_type": "bearer", "expires_in": 0, "scope": "string" }

```
**NOTE:** This is likely how you'll be doing it if you manage multiple Pinterest Apps for users in your web/mobile app. Because you'll have multiple access_tokens and refresh_tokens, you can't have this in an .env configuration. You'll likely create new clients every time you refresh with your users' or customers' saved access/refresh_tokens.
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Release

Update the version number in `version.rb`, update `CHANGELOG.md`, run `bundle install` to update Gemfile.lock, delete previous `rails-pinterest-{number}.gem`, run `gem build rails-pinterest.gemspec`, and then run `sudo bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org) by `gem push rails-pinterest-{number}.gem`.

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/royalgiant/rails-pinterest>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/royalgiant/rails-pinterest/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruby Pinterest project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/royalgiant/rails-pinterest/blob/main/CODE_OF_CONDUCT.md).

## Influences
Project heavily influenced by [https://github.com/alexrudall/ruby-openai](https://github.com/alexrudall/ruby-openai). Great project, go give them a star!