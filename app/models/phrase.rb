class Phrase < ApplicationRecord
  has_one :audio
  belongs_to :sentence

  mount_uploader :audio, AudioUploader
end
