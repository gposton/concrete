class StaticPagesController < ApplicationController
  def home
    @sets = Fuser.find_by_username(FLICKR_USERNAME).sets
  end
end
