module Services
  module HotelService
    include HTTParty

    # Read offer_service URL from configuration file services.yml
    base_uri Rails.application.config_for(:services)["offer_service"]

    class << self
      def get_deals query
        begin
          response = get('/', {query: query}).parsed_response
          return response['offers']['Hotel']
        rescue
          return nil
        end
      end
    end

  end
end
