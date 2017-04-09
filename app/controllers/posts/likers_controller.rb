class Posts::LikersController < ApplicationController
  before_action :authenticate_user!

  def index
    likers = @post.likers.paginate(page: params[:page], per_page: 10)
    render json: likers, meta: pagination_dict(likers), status: 200
  end

  private

    def set_post
      @post = Post.find_by(params[:post_id])
    end
end
