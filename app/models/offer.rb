class Offer < ApplicationRecord
  include HTTParty
  base_uri 'https://offersvc.expedia.com/offers/v2/getOffers?scenario=deal-finder&page=foo&uid=foo&productType=Hotel'

  class << self
    def get_deals params={}
      query = params['destinationName'].present? ? "&destinationName=#{params['destinationName']}"  : ""

      query = query + "&regionIds=#{params['regionIds']}" if params['regionIds'].present?

      query = query + "&destinationName=#{params['destinationName']}"  if params['regionIds'].present?

      query = query + "&maxTripStartDate=#{params['maxTripStartDate']}"  if params['maxTripStartDate'].present?

      query = query + "&maxStarRating=#{params['maxStarRating']}"  if params['maxStarRating'].present?

      query = query + "&lengthOfStay=#{params['lengthOfStay']}"  if params['lengthOfStay'].present?

      response = get('/', {query: query}).parsed_response
      response['offers']['Hotel']
    end
  end
end
