class List < ActiveRecord::Base
  belongs_to :user
  belongs_to :url
  # Remember to create a migration!
end
