module Pinterest
  class Boards
    def initialize(client: nil)
      @client = client
    end

    def get_boards
      @client.get(path: "/boards")
    end 

    def get_generation(id:)
      @client.get(path: "/generations/#{id}")
    end

    def generate_texture_generation(parameters: {})
      @client.json_post(path: "/generations-texture", parameters: parameters)
    end

    def delete_texture_generation(id:)
      @client.delete(path: "/generations-texture/#{id}")
    end
  end
end