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
