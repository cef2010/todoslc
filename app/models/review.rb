class Review < ActiveRecord::Base

  has_many :replies
  belongs_to :activity
  belongs_to :user

end
