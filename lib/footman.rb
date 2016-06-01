# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'
class Footman < Unit
  def initialize
    super(60,10) 
  end

#   def change_attack_power(num) #unnecessary for now
#     @attack_power = num
#   end
  
  def attack!(enemy)
    if can_attack?(enemy) 
      if enemy.class == Barracks
          damage_amount = (attack_power.to_f / 2).ceil
          enemy.damage(damage_amount)
      else 
        enemy.damage(attack_power)
      end
    end
  end
    
end
