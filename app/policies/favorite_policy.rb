class FavoritePolicy < ApplicationPolicy
	def index?
		true
	end

	def create?
    user.present?
  end
 
  def update?
    create?
  end

  def destroy?
   	(user.present? && (user.admin? || user.moderator? || user.recordOwner?))  
   end
end