class QueryParams

  # This used to allow using validates method.
  include ActiveModel::Validations

  # Validates all the given params
  validates :region_id, :length_of_stay, :max_star_rating, :min_star_rating,
    numericality: { greater_than: 0 }, allow_blank: true

  validate do
    if max_star_rating.present? && min_star_rating.present? && max_star_rating < min_star_rating
      errors.add(:max_star_rating, 'must be greater than Min Star Rating')
    end
  end

  validate do
    if max_start_date.present?
      if (QueryParams.invalid_date?(max_start_date))
        errors.add(:max_start_date, 'is not a valid date')
      end
    end
  end

  validate do
    if min_start_date.present?
      if (QueryParams.invalid_date?(min_start_date))
        errors.add(:min_start_date, 'is not a valid date')
      end
    end
  end

  validate do
    if max_start_date.present? && min_start_date.present? && max_start_date < min_start_date
      errors.add(:max_start_date, 'must be greater than Min Trip Start Date')
    end
  end

  # attr_accessor method is used to create setter and getter
  # methods to all the given attributes
  # Ex: for the region_id attribute, the following two methods will be created:

  # Getter Method
  # def region_id
  #   @region_id
  # end

  # Setter Method
  # def region_id= value
  #   @region_id = value
  # end

  attr_accessor :destination_name, :region_id, :min_start_date, :max_start_date,
    :min_star_rating, :max_star_rating, :length_of_stay

  def get_query_params
    # Start with empty string and add params only if they exist
    # Self refers to the current object that is call the method.
    # Object that is being created in the controller.

    # self.destination_name.present? checks if the the @destination_name attribute
    # contains value or not.
    query = ""
    query += "&destinationName=#{self.destination_name}"  if self.destination_name.present?
    query += "&regionIds=#{self.region_id}" if self.region_id.present?
    query += "&minTripStartDate=#{self.min_start_date}"  if self.min_start_date.present?
    query += "&maxTripStartDate=#{self.max_start_date}"  if self.max_start_date.present?
    query += "&minStarRating=#{self.min_star_rating}"  if self.min_star_rating.present?
    query += "&maxStarRating=#{self.max_star_rating}"  if self.max_star_rating.present?
    query += "&lengthOfStay=#{self.length_of_stay}"  if self.length_of_stay.present?

    # No need to use return because in ruby by default the last executed
    # statment wil be returned without using the return.
    query
  end

  private
    def self.invalid_date? date
      (DateTime.parse(date) rescue ArgumentError) == ArgumentError
    end
end
