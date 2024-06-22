## [Unreleased]

## [0.1.0] - 2023-11-30

- Initial release
- Endpoints for Pins and Boards created

## [0.1.1] - 2023-11-30
- Update the gemfile.lock
- Push the tagged version to github
- Re-release to rubygems

## [0.1.2] - 2023-12-2
- Added oauth refresh token endpoint.

## [0.1.3] - 2023-12-2
- Add to ReadMe how to get access token from a authorization token

## [0.1.4] - 2024-01-17
- Add keywords and terms to API

## [0.1.5] - 2024-01-17
- Update terms API.

## [0.1.6] - 2024-01-26
- Update suggested related terms to use limit of 10 instead of 4.

## [0.1.7] - 2024-02-24
- Update URL of keyword metrics

## [0.1.8] - 2024-02-24
- Bump version for changes in ReadMe.

## [0.1.9] - 2024-02-24
- Correct the parameters for keyword metrics, get_country_keyword_metrics

## [0.2.0] - 2024-02-25
- Correct the query parameters for keyword trends

## [0.2.1] - 2024-03-11
- Add Media to API

## [0.2.2] - 2024-03-11
- Fix param requirement for Media#register_media_upload

## [0.2.3] - 2024-03-11
- Revert V.0.2.3

## [0.2.4] - 2024-04-09
- Add User Account to API

## [0.2.5] - 2024-05-10
- Add the beta endpoint https://developer.pinterest.com/docs/api/v5/#operation/multi_pins/analytics (it doesn't really work right now)
- Example usage:
```ruby
client = Pinterest::Client.new(access_token: "some-access-token")
params = {
    pin_ids: ["920634348815764178","920634348815790715","920634348815829069","920634348815865049","920634348815897303","920634348815911959","920634348815943797","920634348816238458","920634348816183143","920634348816403644","920634348816488886","920634348816699966"],
    start_date: "2024-03-01",
    end_date: "2024-05-10",
    metric_types: ["IMPRESSION", "OUTBOUND_CLICK", "PIN_CLICK", "SAVE", "SAVE_RATE", "VIDEO_MRC_VIEW", "VIDEO_10S_VIEW", "QUARTILE_95_PERCENT_VIEW", "VIDEO_V50_WATCH_TIME", "VIDEO_START", "VIDEO_AVG_WATCH_TIME", "TOTAL_COMMENTS", "TOTAL_REACTIONS"]
}
response = client.pins.get_multiple_pin_analytics(ids: params[:pin_ids], start_date: params[:start_date], end_date: params[:end_date], metric_types: params[:metric_types], parameters: {})
```

## [0.2.6] - 2024-06-22
- Added retries to the Faraday connections

## [0.2.7] - 2024-06-22
- Revert retries. Didn't work.