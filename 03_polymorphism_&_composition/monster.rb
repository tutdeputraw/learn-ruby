class Monster
  attr_reader :name,
              :attack_point
  attr_accessor :hit_point,
                :total_frozen_turn,
                :total_burnt_turn,
                :burnt_attack_point

  def initialize(name, hit_point, attack_point)
    @name = name
    @hit_point = hit_point
    @attack_point = attack_point
    @total_frozen_turn = 0
    @total_burnt_turn = 0
    @burnt_attack_point = 0
  end

  def to_s
    if @hit_point.positive?
      status = if frozen?
                 '[frozen]'
               elsif burnt?
                 '[burnt]'
               else
                 ''
               end

      "#{@name}[#{@hit_point}]" + status
    else
      "#{@name}[X]"
    end
  end

  def attack(monster)
    monster.take_damage(@attack_point)
    take_damage(0.5 * monster.attack_point)

    puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
  end

  def frozen?
    @total_frozen_turn.positive?
  end

  def burnt?
    @total_burnt_turn.positive?
  end

  def take_damage(amount)
    @hit_point -= amount
  end

  def apply_effects
    receive_burnt_efect
    receive_frozen_efect
  end

  def receive_frozen_efect
    return unless frozen?

    @total_frozen_turn -= 1
  end

  def receive_burnt_efect
    return unless burnt?

    take_damage(@burnt_attack_point)
    @total_burnt_turn -= 1
  end
end