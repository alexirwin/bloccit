class AdvertisementsController < ApplicationController
  def index
  	@advertisements = Advertisement.all
  end

  def show
  	@advertisement = Advertisement.find(1)
  end
end
