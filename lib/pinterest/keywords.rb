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

    def get_country_keyword_metrics(ad_account_id:, country_code:, keywords:, parameters: {})
      @client.get(path: "/ad_accounts/#{ad_account_id}/keywords/metrics?country_code=#{country_code}&keywords=#{keywords}", parameters: parameters)
    end

    # Region list: "US" "CA" "DE" "FR" "ES" "IT" "DE+AT+CH" "GB+IE" "IT+ES+PT+GR+MT" "PL+RO+HU+SK+CZ" "SE+DK+FI+NO" "NL+BE+LU" "AR" "BR" "CO" "MX" "MX+AR+CO+CL" "AU+NZ"
    # trend_type: "growing" "monthly" "yearly" "seasonal"
    # interest: "animals" "architecture" "art" "beauty" "childrens_fashion" "design" "diy_and_crafts" "education" "electronics" "entertainment" "event_planning" "finance" 
    # "food_and_drinks" "gardening" "health" "home_decor" "mens_fashion" "parenting" "quotes" "sport" "travel" "vehicles" "wedding" "womens_fashion"
    # genders: "female" "male" "unknown"
    # ages: "18-24" "25-34" "35-44" "45-49" "50-54" "55-64" "65+"
    # normalize_against_group (boolean): false (default) 
    # limit [1-50]
    # https://developer.pinterest.com/docs/api/v5/#operation/trending_keywords/list
    def list_trending_keywords(region:, trend_type:, interest:, gender:, ages:, normalize_against_group:, limit:, parameters: {})
      @client.get(path: "/trends/keywords/#{region}/top/#{trend_type}?interest=#{interest}&gender=#{gender}&ages=#{ages}&normalize_against_group=#{normalize_against_group}&limit=#{limit}", parameters: parameters)
    end
  end
end