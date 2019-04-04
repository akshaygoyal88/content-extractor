class UrlSerializer < ActiveModel::Serializer
  attributes :link

  has_many :h1s, key: :h1
  has_many :h2s, key: :h2
  has_many :h3s, key: :h3
  has_many :as, key: :a
end
