class FavoritesController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: post)
		authorize favorite
		if favorite.save
			redirect_to [post.topic, post], notice: "This post is now one of your favorites."
			# Add code to generate a success flash and redirect to post
			# Remember the path shortcut: [post.topic, post]
		else
			redirect_to [post.topic, post], flash[:error] = "There was an error making this post one of your favorites.  Please try again."
			# Add code to generate a failure flash and redirect to post
		end
 end

	def destroy
		post = Post.find(params[:post_id])
		favorite = current_user.favorited(post)
		# Find the current user's favorite with the ID in the params
		authorize favorite 
		favorite.destroy
		if favorite.destroy
		redirect_to [post.topic, post], notice: "This post is no longer a favorite."
		# Flash success and redirect to @post
		else
		redirect_to [post.topic, post], flash[:notice] = "There was an error removing your favorite.  Please try again."
		end
 	end

 end