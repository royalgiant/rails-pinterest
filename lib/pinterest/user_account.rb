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
  
      def get_user_account_top_pins_analytics(parameters: {})
      end

    end
  end