class TopicsController < ApplicationController
def index
  	@topics = Topic.paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def show
  	@topic = Topic.find(params[:id])
  	@posts = @topic.posts.paginate(page: params[:page], per_page: 10)
  	authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
  	  redirect_to @topic, notice: "Topic was saved."
    else
      flash[:error] = "There was an error saving the topic.  Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end
 
  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      	redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic.  Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topics = Topic.paginate(page: params[:page], per_page: 10)
    # authorize @topics
    # raise "made it here."
    authorize @topic
    @topic.destroy
    if @topic.destroy
      # redirect_to :index, notice: "Topic was deleted."
      flash[:notice] = "Topic was deleted."
      render "topics/index", locals: { topics: @topics}
      # render :index
    else
      redirect_to @topic, flash[:error] = "There was an error saving the topic.  Please try again."
    end
  end


  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

end
