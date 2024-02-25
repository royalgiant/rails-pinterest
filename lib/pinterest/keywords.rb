module Pinterest
  class Keywords
    def initialize(client: nil)
      @client = client
    end

    def get_keywords(ad_account_id:, parameters: {})
      @client.get(path: "/ad_accounts/#{ad_account_id}/keywords", parameters: parameters)
    end

    def create_keywords(ad_account_id:, parameters: {})
      @client.json_post(path: "/ad_accounts/#{ad_account_id}/keywords", parameters: parameters)
    end

    def update_keywords(ad_account_id:, parameters: {})
      @client.patch(path: "/ad_accounts/#{ad_account_id}/keywords", parameters: parameters)
    end

    def get_country_keyword_metrics(ad_account_id:, parameters: {})
      @client.get(path: "/ad_accounts/#{ad_account_id}/keywords/metrics", parameters: parameters)
    end

    # Region list: "US" "CA" "DE" "FR" "ES" "IT" "DE+AT+CH" "GB+IE" "IT+ES+PT+GR+MT" "PL+RO+HU+SK+CZ" "SE+DK+FI+NO" "NL+BE+LU" "AR" "BR" "CO" "MX" "MX+AR+CO+CL" "AU+NZ"
    # trend_type: "growing" "monthly" "yearly" "seasonal"
    # https://developer.pinterest.com/docs/api/v5/#operation/trending_keywords/list
    def list_trending_keywords(region:, trend_type:, parameters: {})
      @client.get(path: "/trends/keywords/#{region}/top/#{trend_type}", parameters: parameters)
    end
  end
end