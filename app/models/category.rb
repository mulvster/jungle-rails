class Category < ActiveRecord::Base

  has_many :products

  validates :name, length: { minimum: 4 }

end
