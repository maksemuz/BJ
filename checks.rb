module Checks
  def winner
    if (@gamer.check_points > @dealer.check_points && !@gamer.over?) \
    || (!@gamer.over? && @dealer.over?)
      @gamer.cash += 20
      @gamer
    elsif (@gamer.check_points < @dealer.check_points && !@dealer.over?) \
    || (!@dealer.over? && @gamer.over?)
      @dealer.cash += 20
      @dealer
    elsif @gamer.check_points == @dealer.check_points && !@dealer.over?
      @gamer.cash += 10
      @dealer.cash += 10
      'both'
    elsif @gamer.over? && @dealer.over?
      nil
    end
  end

  def output(pobeditel)
    puts "Результат дилера:\t #{@dealer.show_cards}, #{@dealer.check_points} очков.\n"
    puts "Ваш результат   :\t #{@gamer.show_cards}, #{@gamer.check_points} очков.\n"
    puts "Победитель: #{pobeditel.name}. Ваш счет: #{@gamer.cash}" if [@gamer, @dealer].include? pobeditel
    puts "Ничья. Ваш счет: #{@gamer.cash}" if pobeditel == 'both'
    puts "Общий проигрыш. Ваш счет: #{@gamer.cash}" if pobeditel.nil?
  end

  def again
    print 'Играем еще? (Да = 1, Нет = 0): '
    if gets.strip.to_i == 1
      start
    else
      exit
    end
  end
end
