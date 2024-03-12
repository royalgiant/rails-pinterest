module Pinterest
  class Media
    def initialize(client: nil)
      @client = client
    end

    def list_media_uploads(bookmark:, page_size:, parameters: {})
      @client.get(path: "/media", parameters: parameters)
    end

    def register_media_upload(media_type:, parameters: {})
      @client.json_post(path: "/media", parameters: parameters)
    end

    def get_media_upload_details(media_id:, parameters: {})
      @client.get(path: "/media/#{media_id}", parameters: parameters)
    end
  end
end