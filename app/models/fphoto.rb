class Fphoto
  require 'flickraw'

  def initialize(json)
    @json = json
  end

  def id
    @json['id']
  end

  def url(size='medium')
    s = case size
        when 'thumb'
          't'
        when 'medium'
          'z'
        when 'large'
          'b'
        end

    "http://farm#{@json[:farm]}.staticflickr.com/#{@json[:server]}/#{self.id}_#{@json[:secret]}_#{s}.gif"
  end
end
