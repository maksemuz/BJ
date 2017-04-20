
require_relative 'engine'
require_relative 'checks'
include Checks
include Engine

@gamer = Player.new
@dealer = Player.new

start
loop do
  main_menu(@start_options)
  @gamer.any_cash?
  again?
end
