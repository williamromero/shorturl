class Link < ApplicationRecord
  validates :original_url, presence: true
  validates_uniqueness_of :slug

  has_many :ip_lists
end
