class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :created_at, :username

  def username
    object.user.username
  end
end
