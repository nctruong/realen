class Sentence < ApplicationRecord
  has_many :phrases
  has_one :audio
  belongs_to :section

  mount_uploader :audio, AudioUploader
end
