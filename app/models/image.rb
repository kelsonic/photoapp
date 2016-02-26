class Image < ActiveRecord::Base
  
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validate :picture_size
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :picture, presence: true
  
  private
  
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB.")
      end
    end
  
end
