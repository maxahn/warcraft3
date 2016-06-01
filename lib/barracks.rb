require_relative 'footman'
require_relative 'peasant'
require_relative 'siege_engine' #are these necessary?

class Barracks
  
  attr_accessor :gold, :food, :health_points, :lumber

  def initialize 
    @gold = 1000
    @food = 80 
    @health_points = 500
    @lumber = 500
  end

  def can_train_footman? 
  gold >= 135 && food >= 2 
  end
  
  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
    Footman.new 
    else 
      nil
    end
  end

  def can_train_peasant?
    gold >= 90 && food >= 5
  end

  def train_peasant
    if can_train_peasant? 
      @gold -= 90
      @food -= 5
      Peasant.new
    else 
      nil
    end
  end
  
  def build_siege_engine
    if can_build_siege_engine?
      @gold -= 200
      @lumber -= 60
      @food -= 3
      SiegeEngine.new
    else
      nil
    end
  end

  def can_build_siege_engine?
    enough_food = food >= 3
    enough_gold = gold >= 200
    enough_lumber = lumber >= 60

    enough_food && enough_gold && enough_lumber 
    # food >= 3 && gold >= 200 && lumber >= 60    #was messing up the stubs in tests
  end

  def damage(amount)
    self.health_points -= amount
  end
end
