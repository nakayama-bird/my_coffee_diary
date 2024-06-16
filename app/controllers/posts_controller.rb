class PostsController < ApplicationController
    def index
        @posts = Post.includes(:user).order(created_at: :desc).page params[:page]
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        pp post_params
        if @post.save
            redirect_to posts_path, data: { action: "modal#open" , "data-modal-open-value": "true"} 
        else
            flash.now[:alert] = "投稿に失敗しました"
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(post_params), success: "投稿の更新に成功しました！ナイスコーヒー！"
        else
            flash.now[:alert] = "投稿の更新に失敗しました"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        post = current_user.posts.find(params[:id])
        post.destroy!
        redirect_to posts_path, success: "投稿を削除しました"
    end

    def myposts
        @posts = Post.includes(:user).where(user_id: current_user.id).order(created_at: :desc).page params[:page]
    end

    private
    def post_params
        params.require(:post).permit(:title, :body, :drink_time, :drink_type, :post_image, :post_image_cache )
    end

end
