require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/adoption.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )

also_reload( '../models/*' )

get '/adoption' do
  @adoptions = Adoption.all

  erb ( :"adoptions/index" )
end

get '/adoptions/new' do
  @owners = Owner.all
  @animals = Animals.all
  erb(:"adoptions/new")
end

post '/adoptions' do
  adoption =Adoption.new(params)
  adoption.save
  redirect to("/adoptions")
end

post '/adoptions/:id/delete' do
  Adoptiong.destroy(params[:id])
  redirect to("/adoptions")
end
