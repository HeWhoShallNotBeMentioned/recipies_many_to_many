require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#serves menu page
get("/") do
  erb(:index)
end

#serves list of all recipes
get("/recipes") do
  @recipes = Recipe.all()
  erb(:recipes)
end

#create a new recipe
post("/recipes") do
  recipe_name = params.fetch("recipe_name")
  instructions = params.fetch("instructions")
  Recipe.create({:recipe_name => recipe_name, :instructions => instructions})
  redirect("/recipes")
end

#gets one recipe and its ingredients
get("/recipes/:id") do
  @recipes = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all()
  erb(:recipe)
end

#returns the list of all of ingredients
get("/ingredients") do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

#creates a new ingredient
post("/ingredients") do
  ingredient_name = params.fetch("ingredient_name")
  Ingredient.create({:ingredient_name => ingredient_name})
  redirect("/ingredients")
end


get("/ingredients/:id") do
  id = params.fetch("id")
  @ingredient = Ingredient.find(id)
  erb(:ingredient)
end

get('/ingredients/:id/edit') do
  ingredient_id = params.fetch("id")
  @ingredient = Ingredient.find(ingredient_id)
  erb(:ingredient_edit)
end

get("/recipes/:id/edit") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe_edit)
end

patch("/ingredients/:id") do
  ingredient_id = params.fetch("id").to_i()
  ingredient_name = params.fetch("ingredient_name")
  ingredient = Ingredient.find(ingredient_id)
  ingredient.update(ingredient_name: ingredient_name)
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

patch("/recipes/:id") do
  recipe_id = params.fetch("id").to_i()
  recipe_name =params.fetch("recipe_name")
  recipe = Recipe.find(recipe_id)
  recipe.update(recipe_name: recipe_name)
  @recipes = Recipe.all()
  erb(:recipes)
end

get("/recipes/:id/delete") do
  recipe = Recipe.find(params.fetch("id").to_i())
  @recipes = Recipe.all()
  recipe.destroy()
  erb(:recipes)
end

get("/ingredients/:id/delete") do
  ingredient = Ingredient.find(params.fetch("id").to_i())
  @ingredients = Ingredient.all()
  ingredient.destroy()
  erb(:ingredients)
end
