# encoding: utf-8
module Bootsy
  class ImageUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave
  
    process :tags => ["bootsy_image", "#{Apartment::Tenant.current}"]
    process :convert => "jpg"
  
    version :thumbnail do
      eager
      resize_to_fit(300, 300)
      cloudinary_transformation :quality => 90
    end
  
    def extension_white_list
      %w(jpg jpeg gif png)
    end
  
  
    def public_id
      return "#{Apartment::Tenant.current}/" + model.name
    end

  end
end
