class GalleriesController < ApplicationController
  def index
    @sets = Fuser.find_by_username(FLICKR_USERNAME).sets
  end

  def show
    @set = Fset.get_set params[:id]
  end
end
