module Engine
  require_relative 'desk'
  require_relative 'player'

  def start
    @desk = Desk.new
    @start_options = {
      quit: 'Выход',
      pass: 'Пропустить ход',
      take_card: 'Взять карту',
      open: 'Открыть карты'
    }
    @gamer.cards.clear
    @dealer.cards.clear
    @gamer.pay
    @dealer.pay
    2.times { @gamer.cards << @desk.one_card }
    2.times { @dealer.cards << @desk.one_card }
    puts "\n============= ИГРАЕМ ==============="
  end

  def main_menu(options)
    puts "Карты дилера:\t #{@dealer.hide_cards}\n"
    puts "Ваши карты:\t #{@gamer.show_cards}\n"
    puts '------ Ваш ход: -------'
    options.values.each_with_index { |line, index| puts "#{index}:\t#{line}" }
    print '> '
    send options.keys[gets.strip.to_i]
  end

  def take_card
    @gamer.cards << @desk.one_card
    @start_options.delete(:take_card)
    dealer_turn
  end

  def pass
    @start_options.delete(:pass)
    dealer_turn
  end

  def dealer_turn
    print "Ход дилера: "
    if @dealer.check_points <= 15 && @dealer.not_three_cards?
      @dealer.cards << @desk.one_card
      puts "Взял карту"
    else
      puts "Пропустил ход"
    end
    main_menu(@start_options)
  end

  def open
    output winner
  end

  def quit
    exit
  end
end
