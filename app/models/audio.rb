class Audio < ApplicationRecord
  mount_uploader :path, AudioUploader
end
