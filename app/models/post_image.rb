class PostImage < ActiveRecord::Base
  mount_uploader :file, ImageUploader
end
