require( 'sinatra')
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

get '/owners/:id' do
  @owner = Owner.find(params['id'].to_i)
  erb( :"owners/show")
end
