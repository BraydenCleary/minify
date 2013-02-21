include SecureRandom

class Url < ActiveRecord::Base
  belongs_to :user

  before_create :shorten_url
  validate :url_format
  
  private

  def shorten_url
    self.short = SecureRandom.hex(7)
  end

  def url_format
    link = URI.parse(self.long)
    self.errors.add(:long, "Invalid URL please go back and try again") unless link.kind_of?(URI::HTTP)
  end

end
