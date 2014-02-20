class User < ActiveRecord::Base
  has_many :lists
  has_many :urls, through: :lists

  validates :email, uniqueness: true
  # Remember to create a migration!
end

class Encode
  def initialize(key)
    @salt= key
  end

  def encrypt(text)
    Digest::SHA1.hexdigest("--#{@salt}--#{text}--")
  end
end

ENCODER = Encode.new("shorty")
