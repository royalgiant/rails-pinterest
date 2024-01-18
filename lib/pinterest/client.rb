module Pinterest
  class Client
    include Pinterest::HTTP

    CONFIG_KEYS = %i[
      api_type
      api_version
      access_token
      refresh_token
      client_id
      secret_key
      uri_base
      request_timeout
      extra_headers
    ].freeze
    attr_reader *CONFIG_KEYS

    def initialize(config = {})
      CONFIG_KEYS.each do |key|
        # Set instance variables like api_type & access_token. Fall back to global config
        # if not present.
        instance_variable_set("@#{key}", config[key] || Pinterest.configuration.send(key))
      end
    end

    def boards
      @boards ||= Pinterest::Boards.new(client: self)
    end

    def pins
      @pins ||= Pinterest::Pins.new(client: self)
    end

    def terms
      @terms ||= Pinterest::Terms.new(client: self)
    end

    def keywords
      @pins ||= Pinterest::Keywords.new(client: self)
    end

    def oauth
      @oauth ||= Pinterest::Oauth.new(client: self)
    end
  end
end