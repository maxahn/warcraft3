class Unit

  attr_reader :health_points, :attack_power
  
  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def damage(amount)
    @health_points -= amount
  end

  def attack!(enemy)
    damage_amount = attack_power 
    if enemy.class == Barracks
      damage_amount /= 2
    end
    enemy.damage(damage_amount) unless self.dead? || enemy.dead? 
  end

  def dead?
    health_points <= 0
  end
end
