require("spec_helper")

describe('go to view all recipies.', {:type => :feature}) do
  it('will return give the appropriate message if no recipies have been entered') do
    visit('/')
    click_link('View Recipes')
    expect(page).to have_content('There are currently no recipes in the database')
  end

it('will return give the appropriate message if recipies have been entered') do
  visit('/')
  click_link('View Recipes')
  fill_in('recipe_name', :with => 'pizza')
  click_button('Add Recipe')
  expect(page).to have_content('Current Recipes')
end

end
