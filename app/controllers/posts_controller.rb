class PostsController < ApplicationController
    def index
        @posts = Post.includes(:user).order(created_at: :desc)
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path, success: "投稿に成功しました！ナイスコーヒー！"
        else
            flash.now[:danger] = "投稿に失敗しました"
            render :new, status: :unprocessable_entity
        end

    end

    def post_params
        params.require(:post).permit(:title, :body, :drink_time, :drink_type, :post_image, :post_image_cache )
    end
end
