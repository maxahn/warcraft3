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
    enemy.damage(attack_power) unless self.dead? || enemy.dead? 
  end

  def dead?
    health_points <= 0
  end

  def can_attack?(enemy)
     !self.dead? && !enemy.dead? 
  end
end
