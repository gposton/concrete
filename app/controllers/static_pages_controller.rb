class StaticPagesController < ApplicationController
  def home
    sets = Fuser.find_by_username(FLICKR_USERNAME).sets
    sets.each do |set|
      @set = set if set.title == 'home'
    end
    @set||= set.first
  end
end
