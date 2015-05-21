class CommentPolicy < ApplicationPolicy
	def index?
     true
   end
	
	def show?
     index?
   end 


 	def new?
     user.present?
   end

   def create?
     new?
   end
 
end