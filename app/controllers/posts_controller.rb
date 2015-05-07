class PostsController < ApplicationController
# skip_before_action :flash_attack, only: [:index, :new]

  # def index
  # 	@posts = Post.all
  #   authorize @post
  # end

  def show
  	@post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    # @summary = Summary.find(params[:summary_id])
  end

  def new
    # @summary = Summary.find(params[:summary_id])
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
   
  end

  def create
    # @summary = Summary.find(params[:summary_id])
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post.topic = @topic
    # @post.summary = @summary
    authorize @post
   
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@summary, @topic, @post]
    else
      flash[:error] = "There was an error saving the post.  Please try again."
      render :new
    end
  end

  def edit
    # @summary = Summary.find(params[:summary_id])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end
 
  def update
    # @summary = Summary.find(params[:summary_id])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to [@summary, @topic, @post]
    else
      flash[:error] = "There was an error saving the post.  Please try again."
      render :edit
    end
  end 


end

