class Fphoto
  require 'flickraw'

  def initialize(json)
    @json = json
  end

  def id
    @json['id']
  end

  def url(size='medium')
    s = case size.to_s
        when 'thumb'
          '_t'
        when 'medium'
          ''
        when 'large'
          '_b'
        end

    "http://farm#{@json['farm']}.staticflickr.com/#{@json['server']}/#{self.id}_#{@json['secret']}#{s}.jpg"
  end
end
