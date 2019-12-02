require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )

get '/animals' do
  @zombies = Animal.all()
  erb ( :"animals/index" )
end

get '/animals/:id' do
  @zombie = Animal.find(params['id'].to_i)
  erb(:"animals/show")
end
