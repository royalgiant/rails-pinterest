module Pinterest
  class Terms
    def initialize(client: nil)
      @client = client
    end

    # parameters: { terms: ["example", "of", "query"]}
    def list_related_terms(parameters: {})
      @client.get(path: "/terms/related", parameters: parameters)
    end

    def list_suggested_terms(parameters: {})
      @client.get(path: "/terms/suggested", parameters: parameters)
    end
  end
end