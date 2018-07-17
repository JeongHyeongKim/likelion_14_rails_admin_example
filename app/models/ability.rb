class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :student
      can [:index, :show, :new, :create], Article
      can [:edit, :update, :destroy], Article, user_id: user.id
      can :destroy, Comment, user_id: user.id
      can [:create], Comment
    else
      can [:index, :show], Article
    end
  end
end
