module Engine
  require_relative 'desk'
  require_relative 'player'

  def start
    @desk = Desk.new
    @start_options = {
        quit: 'Выход',
        pass: 'Пропустить ход',
        add_card: 'Добавить карту',
        open: 'Открыть карты'
    }
    @gamer.cards.clear
    @dealer.cards.clear
    @gamer.pay
    @dealer.pay
    2.times {@gamer.cards << @desk.get_card}
    2.times {@dealer.cards << @desk.get_card}
    puts "\n============= ИГРАЕМ ==============="
  end

  def main_menu(options)
    puts "Карты дилера:\t #{@dealer.hide_cards}\n"
    puts "Ваши карты:\t #{@gamer.show_cards}\n"
    puts '------ Ваш ход: -------'
    options.values.each_with_index {|line, index| puts "#{index}:\t#{line}"}
    print '> '
    send options.keys[gets.strip.to_i]
  end

  def add_card
    @gamer.cards << @desk.get_card
    @start_options.delete(:add_card)
    dealer_turn
  end

  def pass
    @start_options.delete(:pass)
    dealer_turn
  end

  def dealer_turn
    puts "Ход дилера"
    if @dealer.get_points <= 15 && not_three_cards?
      @dealer.cards << @desk.get_card
      puts "Взял карту"
    else
      puts "Пропустил ход"
    end
    main_menu(@start_options)
  end

  def no_cash?
    if @gamer.cash <= 0
      true
    else
      false
    end
  end

  def not_three_cards?
    if @dealer.cards.size == 3
      true
    else
      false
    end
  end

  def open
    dealer_p = @dealer.get_points
    gamer_p = @gamer.get_points
    puts "Результат дилера:\t #{@dealer.show_cards}, #{dealer_p} очков.\n"
    puts "Ваш результат   :\t #{@gamer.show_cards}, #{gamer_p} очков.\n"
    if (gamer_p > dealer_p && gamer_p <= 21) || (gamer_p < 21 && dealer_p > 21)
      @gamer.cash += 20
      puts "Вы выиграли. Ваш счет: #{@gamer.cash}"
    elsif (gamer_p < dealer_p && dealer_p <= 21) || (dealer_p < 21 && gamer_p > 21)
      @dealer.cash += 20
      puts "Вы проиграли. Ваш счет: #{@gamer.cash}"
    elsif gamer_p == dealer_p && dealer_p <= 21
      @gamer.cash += 10
      @dealer.cash += 10
      puts "Ничья. Ваш счет: #{@gamer.cash}"
    elsif gamer_p > 21 && dealer_p > 21
      puts "Общий проигрыш. Ваш счет: #{@gamer.cash}"
    end
    if no_cash?
      puts "Ваш счет: #{@gamer.cash}. Недостаточно денег для продолжения игры."
      exit
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

  def quit
    exit
  end
end
