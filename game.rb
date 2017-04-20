
require_relative 'engine'
require_relative 'checks'
include Checks
include Engine

@gamer = Player.new('Вы')
@dealer = Player.new('Казино')

start
loop do
  main_menu(@start_options)
  @gamer.any_cash?
  again?
end
