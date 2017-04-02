class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = current_user.posts.build(post_params)
  end

  private

    def post_params
      params.permit(:photo, :caption)
    end
end
