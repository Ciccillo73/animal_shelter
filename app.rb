require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/users_controller')
require_relative('controllers/animals_controller')
require_relative('controllers/shelter_controller')

get '/' do
  erb( :index )
end
