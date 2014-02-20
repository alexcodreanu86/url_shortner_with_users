class Url < ActiveRecord::Base
  has_many :lists
  has_many :users, through: :lists
  # Remember to create a migration!
  before_create  :generate_short_url
  validates :short_url, :long_url ,uniqueness: true
  validates :long_url, presence: true
  def generate_short_url
    self.short_url = SecureRandom.base64(6).gsub(/\W/,"")
  end
end
