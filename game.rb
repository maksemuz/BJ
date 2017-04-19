
require_relative 'engine'
include Engine

@gamer = Player.new
@dealer = Player.new
start

loop do
  main_menu(@start_options)
  again?
end
