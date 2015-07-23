class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment= current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
    	flash[:error] = "There was an error saving the comment.  Please try again."
      redirect_to [@topic, @post]
      #render "posts/show", locals: { topic: @topic, post: @post}
    end

  end


  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment
    @comment.destroy
    if @comment.destroy
      flash[:notice] = "Comment was deleted."
      #redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error deleting the comment.  Please try again."
      #render "posts/show", locals: { topic: @topic, post: @post}
    end
        respond_to do |format|
       format.html
       format.js
     end
  end
	
	private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end

end
