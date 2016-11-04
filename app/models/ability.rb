class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :access, :rails_admin
    can :dashboard
    if user.active_ws == 1
      can :manage, Biomass
      can :manage, BiomassType
      can :manage, Feedstock
      can :manage, Harvest
    elsif user.active_ws == 2
      can :manage, Inventory
      can :manage, InventoryBatch
      can :manage, InventoryUntreatedFeedstock
      can :manage, InventoryPretreatedFeedstock
      can :manage, InventoryHydrolysate
      can :manage, Material
    elsif user.active_ws == 3
      can :manage, User
      can :history, :all
    end
  end
end
