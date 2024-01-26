module Pinterest
  class Terms
    def initialize(client: nil)
      @client = client
    end

    # ex: client.terms.list_related_terms(terms:"anime,soccer")
    def list_related_terms(terms:, parameters: {})
      @client.get(path: "/terms/related?terms=#{terms}", parameters: parameters)
    end

    # ex: client.terms.list_suggested_terms(term: "anime")
    def list_suggested_terms(term:, parameters: {})
      @client.get(path: "/terms/suggested?term=#{term}&limit=10", parameters: parameters)
    end
  end
end