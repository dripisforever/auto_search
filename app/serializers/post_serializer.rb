class PostSerializer < ActiveModel::Serializer
  attributes :id, :photo_url, :filter, :caption, :created_at, :user_id,
             :lat_lng, :adress, :likes_count, :comments_count, :place_id, :filter_style

  belongs_to :user, serializer: UserSerializer
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

  def filter_style
    if object.filter_style.nil?
      ''
    else
      object.filter_style
    end
  end

  def comments
    object.comments.latest.paginate(page: 1)
  end

  def comment_pagination
    {
      'currentPage' => self.comments.current_page,
      'nextPage'    => self.comments.next_page,
      'prevPage'    => self.comments.prev_page,
      'totalPages'  => self.comments.total_pages,
      'totalCount'  => self.comments.total_count
    }
  end
end
