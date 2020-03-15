require 'sinatra'

require_relative 'recipe'

get '/' do
  redirect to('/recipes')
end

get '/about' do
  @title = 'About Us'
  erb :about
end

get '/contact' do
  @title = 'Contact Us'
  erb :contact
end

get '/add' do
  @title = 'Add Recipe'
  erb :form
end

get '/legal' do
  @title = 'Legal Stuff'
  erb :legal
end

get '/recipes' do
  @title = 'Recipes'

  @recipes = Recipe.all

  erb :recipes
end

get '/recipes/:id' do

  id = params[:id]
  @recipe = Recipe.find(id)
  @title = @recipe.name

  erb :recipe

end

post '/add' do
puts "post request received .. #{params}"
@recipe = Recipe.new
@recipe.name = params[:rName]
@recipe.prep_time = params[:prepTime]
@recipe.description = params[:desc]
@recipe.image = params[:imageUrl]



if @recipe.save
redirect to('/recipes')
else 
   redirect to('/add')
end

end
