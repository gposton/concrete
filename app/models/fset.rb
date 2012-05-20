class Fset
  require 'flickraw'

  def initialize(json)
    @json = json
  end

  def id
    @id ||= @json['id']
  end

  def title
    @title ||= @json['title']
  end

  def primary
    if @primary.nil?
      self.photos.each do |photo|
        @primary = photo if photo.id == @json['primary']
      end
    end
    @primary||= self.photos.first
  end

  def thumb
    @thumb||= self.primary.url(:square)
  end

  def photos
    if @photos.nil?
      @photos = []
      flickr.photosets.getPhotos(:photoset_id => self.id)['photo'].each do |photo|
        @photos << Fphoto.new(photo)
      end
    end
    @photos
  end
end
