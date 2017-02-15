class Review < ApplicationRecord
  validates :content, presence:true
  validates_numericality_of :rating, only_integer: true
  validates :rating, inclusion: { in: (0..5), allow_nil:false}



  belongs_to :restaurant
end
