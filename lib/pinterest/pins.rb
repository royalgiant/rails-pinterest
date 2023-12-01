module Pinterest
  class Pins
    def initialize(client: nil)
      @client = client
    end

    def list_pins(parameters: {})
      @client.get(path: "/pins", parameters: parameters)
    end

    def create_pin(parameters: {})
      @client.json_post(path: "/pins", parameters: parameters)
    end

    def get_pin(id:, parameters: {})
      @client.get(path: "/pins/#{id}", parameters: parameters)
    end

    def delete_pin(id:)
      @client.delete(path: "/pins/#{id}")
    end

    def update_pin(id: , parameters: {})
      @client.patch(path: "/pins/#{id}", parameters: parameters)
    end

    def get_pin_analytics(id:, parameters: {})
      @client.get(path: "/pins/#{id}/analytics", parameters: parameters)
    end

    def save_pin(id: , parameters: {})
      @client.json_post(path: "/pins/#{id}/save", parameters: parameters)
    end

  end
end