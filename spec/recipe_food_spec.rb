require 'rails_helper'

RSpec.describe RecipeFood type: :model do
  before :each do
    @recipe_food = RecipeFood.create(food: 'Biryani', quantity: 1)
  end

  context 'RecipeFood validations' do
    it 'is not valid without food' do
      @recipe_food.food = nil
      expect(@recipe_food).not_to be_valid
    end
  end
end