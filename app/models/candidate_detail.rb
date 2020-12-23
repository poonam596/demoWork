class CandidateDetail < ApplicationRecord
  has_one_attached :file
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@peerlogicsys.com/
end
