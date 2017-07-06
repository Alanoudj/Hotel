require 'rails_helper'

RSpec.describe QueryParams, type: :model do

  subject {
    described_class.new
  }


  describe 'validations' do
    it 'is valid with valid attributes' do
      subject.region_id = '6126616'
      expect(subject).to be_valid
    end

    it 'is not valid if region_id is not numeric value' do
      subject.region_id = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid if length_of_stay is not numeric value' do
      subject.length_of_stay = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid if max_star_rating is not numeric value' do
      subject.max_star_rating = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid if min_star_rating is not numeric value' do
      subject.min_star_rating = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid if min_star_rating is larger than max_star_rating' do
      subject.min_star_rating = '2017-06-19'
      subject.max_star_rating = '2017-06-15'
      expect(subject).not_to be_valid
    end

    it 'is not valid if min_start_date is not a date' do
      subject.min_start_date = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid if max_start_date is not a date' do
      subject.max_start_date = 'NOT_VALID'
      expect(subject).not_to be_valid
    end

    it 'is not valid if min_start_date is larger than max_start_date' do
      subject.min_start_date = 3
      subject.max_start_date = 1
      expect(subject).not_to be_valid
    end
  end

  describe '#invalid_date?' do
    it 'returns true if the given string is not a valid date' do
      expect(QueryParams.invalid_date?('NOT_VALID')).to be_truthy
    end

    it 'returns flase if the given string is a valid date' do
      expect(QueryParams.invalid_date?('2017-06-19')).to be_falsey
    end
  end

  describe '#get_query_params' do
    it 'returns a query string that contains the given query param' do
      subject.destination_name = 'London'
      query = subject.get_query_params
      expect(query).to include('&destinationName')
    end

    it 'returns an empty query string if you didn\'t send any query params' do
      query = subject.get_query_params
      expect(query).to be_empty
    end
  end
end
