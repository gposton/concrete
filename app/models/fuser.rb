class Fuser
  require 'flickraw'

  def initialize(json)
    @json = json
  end

  def id
    @id ||= @json['id']
  end

  def sets
    if @sets.nil?
      @sets = []
      flickr.photosets.getList(:user_id => id).each do |set|
        @sets << Fset.new(set)
      end
    end
    @sets
  end

  def self.find_by_username(username)
    Fuser.new(flickr.people.findByUsername(:username => FLICKR_USERNAME))
  end
end
