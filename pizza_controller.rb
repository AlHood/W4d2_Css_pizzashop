require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative ('./models/pizza')

# get all pizzas (index)
get '/pizzas/' do
  @pizzas = Pizza.all()
  erb (:index)
end


# new pizzas form
get '/pizzas/new' do
erb (:new)


end


  # send form using post (create)
  post '/pizzas/' do
@pizza = Pizza.new(params)
@pizza.save
erb (:create)
  end


  # get a pizzas by id
  get '/pizzas/:id/' do
@pizza = Pizza.find(params[:id])
erb (:show)
  end


# delete a pizzas by id (destroy)

post '/pizzas/:id/delete' do
Pizza.destroy(params[:id]) 
redirect to('/pizzas')
end

# request edit pizza form (edit)
get '/pizzas/:id/edit' do
@pizza = Pizza.find(params[:id])
erb (:edit)
end


# actualy update the pizza by id
post '/pizzas/:id/' do
  @pizza = Pizza.update(params)
redirect to ("/pizzas/#{params[:id]}/")
end




