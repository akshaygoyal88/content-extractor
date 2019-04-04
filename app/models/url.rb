class Url < ApplicationRecord
  validates :link, uniqueness: true

  has_many :tags
  has_many :h1s
  has_many :h2s
  has_many :h3s
  has_many :as
end
