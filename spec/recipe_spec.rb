require("spec_helper")

describe(Recipe) do
  it("has many ingredients") do
    test_recipe = Recipe.create({:recipe_name => "Chocolate Chip Cookies"})
    test_ingredient1 = Ingredient.create({:ingredient_name => "Butter"})
    test_ingredient2 = Ingredient.create({:ingredient_name => "Salt"})

    test_recipe.ingredients.push(test_ingredient1)

    test_recipe.ingredients.push(test_ingredient2)


    expect(test_recipe.ingredients()).to(eq([test_ingredient1, test_ingredient2]))
  end
end
