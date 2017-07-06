class OffersController < ApplicationController
  def index
    # This will create an object that contains the given params
    # Ex: @region_id=$value

    # In Ruby everything is an object so to create new object
    # we need to call the class method new
    @offer_params = QueryParams.new
    allowed_params = query_params

    @offer_params.destination_name = allowed_params[:destination_name]
    @offer_params.region_id = allowed_params[:region_id]
    @offer_params.min_start_date = allowed_params[:min_start_date]
    @offer_params.max_start_date = allowed_params[:max_start_date]
    @offer_params.min_star_rating = allowed_params[:min_star_rating]
    @offer_params.max_star_rating = allowed_params[:max_star_rating]
    @offer_params.length_of_stay = allowed_params[:length_of_stay]

    # We need to run validations to make sure that data is valid
    # This will run all the validations in the Offer class.
    @deals = nil
    if @offer_params.valid?
      @deals = Offer.get_deals(@offer_params)
    end
  end

  private
    # Controller will accept the following params only, and if we need to
    # use extra params to the query string we need to add them to this method.
    def query_params
      params.permit(:destination_name, :region_id, :min_start_date, :max_start_date,
        :min_star_rating, :max_star_rating, :length_of_stay)
    end
end

