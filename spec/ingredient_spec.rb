require("spec_helper")

describe(Ingredient) do
  it("is an ingredient in a recipe") do
    test_recipe = Recipe.create({:recipe_name => "Chocolate Chip Cookie"})
    test_ingredient1 = Ingredient.create({:ingredient_name => "Butter"})


    test_recipe.ingredients.push(test_ingredient1)


    expect(test_recipe.ingredients()).to(eq([test_ingredient1]))
  end
end
