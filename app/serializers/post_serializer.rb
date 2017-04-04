class PostSerializer < ActiveModel::Serializer
  attributes :id, :photo_url, :filter, :caption, :created_at, :user_id,
             :lat_lng, :adress, :likes_count, :comments_count, :place_id

  belongs_to :user, serializer: UserSimpleSerializer
  has_many :comments

  def photo_url
    object.photo.url
  end

  def lat_lng
    {
      lat: object.lat,
      lng: object.lng
    }
  end

end
