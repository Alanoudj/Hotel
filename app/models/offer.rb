class Offer

  # This used to allow using validates method.
  include ActiveModel::Validations

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  # Validates all the given params
  # Should be valid URL and should be present.
  validates :hotel_url, :image_url, presence: true, format: /\Ahttps?:\/\/[[:alnum:]](?:-?[[:alnum:]])*(?:\.(?:[[:alnum:]](?:-?[[:alnum:]])*))+(?:\/.*|\z)/
  validates :hotel_name, :hotel_destination, :hotel_description, :currency, presence: true
  validates :booked_people_count, :viewing_people_count, :original_price,
    :average_price, numericality: { greater_than_or_equal_to: 0 }

  attr_accessor :image_url, :hotel_name, :hotel_url, :hotel_destination,
    :hotel_description, :booked_people_count, :viewing_people_count,
    :currency, :original_price, :average_price

  def self.get_deals params
    # Call the Hotel service to return all the given deals
    query_params = params.get_query_params
    deals = Services::HotelService.get_deals(query_params)
    deals_arr = []
    if deals.present?
      # Get all the given deals and validate their data.
      deals.each do |deal|

        offer = Offer.new
        offer.image_url = deal.try(:[],'hotelInfo').try(:[],'hotelImageUrl')
        offer.hotel_name = deal.try(:[],'hotelInfo').try(:[],'hotelName')
        offer.hotel_url =  URI.decode(deal.try(:[],'hotelUrls').try(:[],'hotelInfositeUrl'))
        offer.hotel_destination = deal.try(:[],'hotelInfo').try(:[],'hotelLongDestination')
        offer.hotel_description = deal.try(:[],'hotelInfo').try(:[],'description')
        offer.booked_people_count = deal.try(:[],'hotelUrgencyInfo').try(:[],'numberOfPeopleBooked')
        offer.viewing_people_count = deal.try(:[],'hotelUrgencyInfo').try(:[],'numberOfPeopleViewing')
        offer.currency = deal.try(:[],'hotelPricingInfo').try(:[],'currency')
        offer.original_price = deal.try(:[],'hotelPricingInfo').try(:[],'originalPricePerNight')
        offer.average_price = deal.try(:[],'hotelPricingInfo').try(:[],'averagePriceValue')

        deals_arr.append(offer) if offer.valid?
      end # End loop
    end # End if
    deals_arr
  end

end
