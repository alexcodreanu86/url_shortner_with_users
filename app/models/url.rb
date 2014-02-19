class Url < ActiveRecord::Base
  has_many :users
  # Remember to create a migration!
  before_create  :generate_short_url
  validates :short_url, uniqueness: true
  validates :long_url, uniqueness: true , presence: true
  def generate_short_url
    self.short_url = SecureRandom.base64(6).gsub(/\W/,"")
  end
end
