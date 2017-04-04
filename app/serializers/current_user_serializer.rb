class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :created_at, :authentication_token,
             :post_ids, :attrs, :liked_post_ids, :following_ids, :follower_ids

  has_many :posts

  def authentication_token
    JsonWebToken.encode({ user_id: objec.id })
  end

  def attrs
    {
      email: object.email,
      username: object.username,
      avatar_url: object.avatar_url
    }
  end
end
