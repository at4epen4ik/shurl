class ShortUrl < ApplicationRecord
  validates :short_url, uniqueness: true

  def make_short(server_url)
    while !valid? do
      self.short_url = get_shurl
    end
    save

    return {"url": "#{server_url}#{self.short_url}"}
  end

  private
    def get_shurl
      [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
    end
end
