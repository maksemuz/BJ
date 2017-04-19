module Checks
  def who_wins?
    puts "Результат дилера:\t #{@dealer.show_cards}, #{@dealer.check_points} очков.\n"
    puts "Ваш результат   :\t #{@gamer.show_cards}, #{@gamer.check_points} очков.\n"
    if (@gamer.check_points > @dealer.check_points && !@gamer.over?) \
    || (!@gamer.over? && @dealer.over?)
      @gamer.cash += 20
      puts "Вы выиграли. Ваш счет: #{@gamer.cash}"
    elsif (@gamer.check_points < @dealer.check_points && !@dealer.over?) \
    || (!@dealer.over? && @gamer.over?)
      @dealer.cash += 20
      puts "Вы проиграли. Ваш счет: #{@gamer.cash}"
    elsif @gamer.check_points == @dealer.check_points && !@dealer.over?
      @gamer.cash += 10
      @dealer.cash += 10
      puts "Ничья. Ваш счет: #{@gamer.cash}"
    elsif @gamer.over? && @dealer.over?
      puts "Общий проигрыш. Ваш счет: #{@gamer.cash}"
    end
  end

  def again?
    print 'Играем еще? (Да = 1, Нет = 0): '
    if gets.strip.to_i == 1
      start
    else
      exit
    end
  end
end
