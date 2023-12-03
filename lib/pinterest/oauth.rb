module Pinterest
  class Oauth
    def initialize(client: nil)
      @client = client
    end  

    def retrieve_oauth_token(parameters: {})
      @client.oauth_post(path: "/oauth/token", parameters: parameters)
    end
  end
end