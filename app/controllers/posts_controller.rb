class PostsController < ApplicationController

        def show
            @post = Post.find(params[:id])
        end
    
        def index
            @posts = Post.all
        end
    
        def new
            @post = Post.new
        end
    
        def edit
            @post = Post.find(params[:id])
        end
    
        def create
            @post = Post.new(params.require(:post).permit(:data))
            @post.user = User.first
            if @post.save
                redirect_to @post
            else
                render 'new'
            end
        end
    
        def update
            @post = User.find(params[:id])
            @post.update(params.require(:post).permit(:data))
            @post.user = User.first
            if @post.save
                redirect_to @post
            else
                render 'edit'
            end
        end
    
    
end
