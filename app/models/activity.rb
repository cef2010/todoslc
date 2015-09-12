class Activity < ActiveRecord::Base

  has_attached_file :photo, styles: { large: "500x375>", medium: "300x250>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  has_many :reviews

end
