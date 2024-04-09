module Pinterest
    class UserAccount
      def initialize(client: nil)
        @client = client
      end
  
      def get_user_account(parameters: {})
        @client.get(path: "/user_account", parameters: parameters)
      end

      def get_user_account_analytics(start_date:, end_date:, parameters: {})
        query_string = "/user_account/analytics?start_date=#{start_date}&end_date=#{end_date}"
        if parameters[:from_claimed_content] && !parameters[:from_claimed_content].empty?
          query_string += "&from_claimed_content=#{parameters[:from_claimed_content]}"
        end
        if parameters[:pin_format] && !parameters[:pin_format].empty?
          query_string += "&pin_format=#{parameters[:pin_format]}"
        end
        if parameters[:app_types] && !parameters[:app_types].empty?
          query_string += "&app_types=#{parameters[:app_types]}"
        end
        if parameters[:content_type] && !parameters[:content_type].empty?
          query_string += "&content_type=#{parameters[:content_type]}"
        end
        if parameters[:source] && !parameters[:source].empty?
          query_string += "&source=#{parameters[:source]}"
        end
        if parameters[:metric_types] && !parameters[:metric_types].empty?
          query_string += "&metric_types=#{parameters[:metric_types]}"
        end
        if parameters[:split_field] && !parameters[:split_field].empty?
          query_string += "&split_field=#{parameters[:split_field]}"
        end
        if parameters[:ad_account_id] && !parameters[:ad_account_id].empty?
          query_string += "&ad_account_id=#{parameters[:ad_account_id]}"
        end
        @client.get(path: query_string, parameters: parameters)
      end
  
      def get_user_account_top_pins_analytics(start_date:, end_date:, sort_by:, parameters: {})
        query_string = "/user_account/analytics?start_date=#{start_date}&end_date=#{end_date}&sort_by=#{sort_by}"
        if parameters[:from_claimed_content] && !parameters[:from_claimed_content].empty?
          query_string += "&from_claimed_content=#{parameters[:from_claimed_content]}"
        end
        if parameters[:pin_format] && !parameters[:pin_format].empty?
          query_string += "&pin_format=#{parameters[:pin_format]}"
        end
        if parameters[:app_types] && !parameters[:app_types].empty?
          query_string += "&app_types=#{parameters[:app_types]}"
        end
        if parameters[:content_type] && !parameters[:content_type].empty?
          query_string += "&content_type=#{parameters[:content_type]}"
        end
        if parameters[:source] && !parameters[:source].empty?
          query_string += "&source=#{parameters[:source]}"
        end
        if parameters[:metric_types] && !parameters[:metric_types].empty?
          query_string += "&metric_types=#{parameters[:metric_types]}"
        end
        if parameters[:num_of_pins] && !parameters[:num_of_pins].empty?
          query_string += "&num_of_pins=#{parameters[:num_of_pins]}"
        end
        if parameters[:created_in_last_n_days] && !parameters[:created_in_last_n_days].empty?
          query_string += "&created_in_last_n_days=#{parameters[:created_in_last_n_days]}"
        end
        if parameters[:ad_account_id] && !parameters[:ad_account_id].empty?
          query_string += "&ad_account_id=#{parameters[:ad_account_id]}"
        end
        @client.get(path: query_string, parameters: parameters)
      end
      
      def get_user_account_top_video_pins_analytics(start_date:, end_date:, sort_by:, parameters: {})
        query_string = "/user_account/analytics?start_date=#{start_date}&end_date=#{end_date}&sort_by=#{sort_by}"
        if parameters[:from_claimed_content] && !parameters[:from_claimed_content].empty?
          query_string += "&from_claimed_content=#{parameters[:from_claimed_content]}"
        end
        if parameters[:pin_format] && !parameters[:pin_format].empty?
          query_string += "&pin_format=#{parameters[:pin_format]}"
        end
        if parameters[:app_types] && !parameters[:app_types].empty?
          query_string += "&app_types=#{parameters[:app_types]}"
        end
        if parameters[:content_type] && !parameters[:content_type].empty?
          query_string += "&content_type=#{parameters[:content_type]}"
        end
        if parameters[:source] && !parameters[:source].empty?
          query_string += "&source=#{parameters[:source]}"
        end
        if parameters[:metric_types] && !parameters[:metric_types].empty?
          query_string += "&metric_types=#{parameters[:metric_types]}"
        end
        if parameters[:num_of_pins] && !parameters[:num_of_pins].empty?
          query_string += "&num_of_pins=#{parameters[:num_of_pins]}"
        end
        if parameters[:created_in_last_n_days] && !parameters[:created_in_last_n_days].empty?
          query_string += "&created_in_last_n_days=#{parameters[:created_in_last_n_days]}"
        end
        if parameters[:ad_account_id] && !parameters[:ad_account_id].empty?
          query_string += "&ad_account_id=#{parameters[:ad_account_id]}"
        end
        @client.get(path: query_string, parameters: parameters)
      end

      def list_linked_businesses(parameters: {})
        @client.get(path: "/user_account/businesses", parameters: parameters)
      end

      def list_followers(parameters: {})
        @client.get(path: "/user_account/followers", parameters: parameters)
      end

      def list_following(parameters: {})
        @client.get(path: "/user_account/following", parameters: parameters)
      end

      def list_following_boards(parameters: {})
        @client.get(path: "/user_account/following/boards", parameters: parameters)
      end

      def follow_user(username:, parameters: {})
        @client.json_post(path: "/user_account/following/#{username}", parameters: parameters)
      end

      def verify_website(parameters: {})
        @client.json_post(path: "/user_account/websites", parameters: parameters)
      end

      def get_user_websites(parameters: {})
        @client.get(path: "/user_account/websites", parameters: parameters)
      end

      def unverify_website(website:)
        @client.delete(path: "/user_account/websites?website=#{website}")
      end

      def get_user_verification_code_for_website_claiming(parameters: {})
        @client.get(path: "/user_account/websites/verification", parameters: parameters)
      end

      def list_following_interests(username:, parameters: {})
        @client.get(path: "/users/#{username}/interests/follow", parameters: parameters)
      end
    end
  end