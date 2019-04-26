class BonusDrink
  def self.total_count_for(amount)
    total_count = 0
    drink_num = amount
    empty_drink_num = 0
    while drink_num > 0
      total_count += drink_num
      result = exchange(drink_num)
      drink_num = result[:drink_num]
      empty_drink_num += result[:empty_drink_num]
      # 空瓶が溜まったら追加で交換可能
      if empty_drink_num >= 3
        drink_num += empty_drink_num / 3
        empty_drink_num %= 3
        redo
      end
    end
    total_count
  end

  private

  def self.exchange amount
    {
      drink_num: amount / 3,
      empty_drink_num: amount % 3,
    }
  end
end
