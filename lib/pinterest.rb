require "faraday"
require "faraday/multipart"
require_relative "pinterest/http"
require_relative "pinterest/client"
require_relative "pinterest/boards"
require_relative "pinterest/version"

module Pinterest
  class Error < StandardError; end
  class ConfigurationError < Error; end

  class Configuration
    attr_writer :access_token
    attr_accessor :api_type, :api_version, :uri_base, :request_timeout,
                  :extra_headers

    DEFAULT_API_VERSION = "v5".freeze
    DEFAULT_URI_BASE = "https://api.pinterest.com/".freeze
    DEFAULT_REQUEST_TIMEOUT = 120

    def initialize
      @access_token = nil
      @api_type = nil
      @api_version = DEFAULT_API_VERSION
      @uri_base = DEFAULT_URI_BASE
      @request_timeout = DEFAULT_REQUEST_TIMEOUT
      @extra_headers = {
        "accept" => "application/json",
        "content-type" => "application/json"
      }
    end

    def access_token
      return @access_token if @access_token

      error_text = "Pinterest access token missing! See https://github.com/alexrudall/ruby-openai#usage"
      raise ConfigurationError, error_text
    end
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Pinterest::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

