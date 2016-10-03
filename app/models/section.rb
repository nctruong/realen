class Section < ApplicationRecord
  has_many :sentences
  belongs_to :lession

  validates :lession_id, presence: true
end
