class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  validates :picture, attached: true, 
                      content_type: ['image/png','image/jpeg'],
                      size: { less_than: 1.megabytes , message: 'is too large (max 5MB)' }
end
