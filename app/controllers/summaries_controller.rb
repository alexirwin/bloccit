class SummariesController < ApplicationController
  def index
  	@summaries = Summary.all
    authorize @summaries
  end
 def show
  	@summary = Summary.find(params[:id])
  	@posts = @summary.posts
  	authorize @summary
  end

  def new
    @summary = Summary.new
    authorize @summary
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:name, :description, :public))
    authorize @summary
    if @summary.save
  	  redirect_to @summary, notice: "Summary was saved."
    else
      flash[:error] = "There was an error saving the summary.  Please try again."
      render :new
    end
  end

  def edit
    @summary = Summary.find(params[:id])
    authorize @summary
  end
 
  def update
    @summary = Summary.find(params[:id])
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:name, :description, :public))
      	redirect_to @summary
    else
      flash[:error] = "There was an error saving the summary.  Please try again."
      render :edit
    end
  end
end
