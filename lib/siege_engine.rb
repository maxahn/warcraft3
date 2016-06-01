class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  def can_attack?(enemy)
    (enemy.class == SiegeEngine || enemy.class == Barracks) && super(enemy)
  end

  def attack!(enemy)
    if can_attack?(enemy)
      if enemy.class == Barracks 
        damage_amount = attack_power * 2
        enemy.damage(damage_amount)
      else 
        enemy.damage(attack_power)
      end
    end
  end

end
