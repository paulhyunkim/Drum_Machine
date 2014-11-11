class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :tempo
  has_many :patterns
end
