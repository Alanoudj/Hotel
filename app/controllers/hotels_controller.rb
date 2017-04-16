class HotelsController < ApplicationController
  def search
    @items = Offer.get_deals params
  end
end

