require 'rails_helper'

RSpec.describe Offer, type: :model do
  subject {
    described_class.new(
      hotel_url: 'https://deals.expedia.com',
      image_url: 'https://images.trvl-media.com/hotels/14000000/13450000/13449000/13448938/13448938_19_t.jpg',
      hotel_name: 'Via Lewisham - Hostel',
      hotel_destination: 'London (and vicinity), England, United Kingdom',
      hotel_description: 'Located in Lewisham, this hostel is within 2 mi (3 km) of Greenwich Park',
      booked_people_count: 1,
      viewing_people_count: 1,
      original_price: 10,
      average_price: 9,
      currency: 'USD'
    )
  }


  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without hotel_url' do
      subject.hotel_url = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid if hotel_url is not a valid URL' do
      subject.hotel_url = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid if image_url is not a valid URL' do
      subject.image_url = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid without image_url' do
      subject.image_url = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without hotel_name' do
      subject.hotel_name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without hotel_destination' do
      subject.hotel_destination = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without hotel_description' do
      subject.hotel_description = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without currency' do
      subject.currency = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without booked_people_count' do
      subject.booked_people_count = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid if booked_people_count is not numeric value' do
      subject.booked_people_count = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid without viewing_people_count' do
      subject.viewing_people_count = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid if viewing_people_count is not numeric value' do
      subject.viewing_people_count = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid without original_price' do
      subject.original_price = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid if original_price is not numeric value' do
      subject.original_price = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid without average_price' do
      subject.average_price = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid if average_price is not numeric value' do
      subject.average_price = 'NOT_VALID'
      expect(subject).not_to be_valid
    end
  end

  describe '#get_deals' do
    it 'returns array of deals that match the given query' do
      offer_params = QueryParams.new

      offer_params.destination_name = 'London'
      offer_params.min_star_rating = 1
      deals = Offer.get_deals(offer_params)
      expect(deals.class).to eq(Array)
    end
  end
end
