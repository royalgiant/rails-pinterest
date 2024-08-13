module Pinterest
  class Boards
    def initialize(client: nil)
      @client = client
    end

    def get_boards(bookmark: nil, parameters: {})
      if bookmark&.present?
        @client.get(path: "/boards?page_size=100&bookmark=#{bookmark}", parameters: parameters)
      else
        @client.get(path: "/boards?page_size=100", parameters: parameters)
      end
    end 

    def create_board(parameters: {})
      @client.json_post(path: "/boards", parameters: parameters)
    end

    def get_board(id:, parameters: {})
      @client.get(path: "/boards/#{id}", parameters: parameters)
    end

    def update_board(id:, parameters: {})
      @client.patch(path: "/boards/#{id}", parameters: parameters)
    end

    def delete_board(id:)
      @client.delete(path: "/boards/#{id}")
    end

    def get_board_pins(id:, parameters: {})
      @client.get(path: "/boards/#{id}/pins", parameters: parameters)
    end

    def get_board_sections(id:, parameters: {})
      @client.get(path: "/boards/#{id}/sections", parameters: parameters)
    end

    def create_board_sections(id:, parameters: {})
      @client.json_post(path: "/boards/#{}/sections", parameters: parameters)
    end

    def update_board_section(id:, section_id:, parameters: {})
      @client.patch(path: "/boards/#{id}/sections/#{section_id}", parameters: parameters)
    end

    def delete_board_section(id:, section_id:)
      @client.patch(path: "/boards/#{id}/sections/#{section_id}")
    end

    def get_board_section_pins(id:, section_id:, parameters: {})
      @client.get(path: "/boards/#{id}/sections/#{section_id}/pins", parameters: parameters)
    end
  end
end