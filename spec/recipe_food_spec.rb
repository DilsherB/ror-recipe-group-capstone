require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: 123_456, password_confirmation: 123_456) }
  let(:recipe) do
    Recipe.create(name: 'Apples', preparation_time: '1 hour', cooking_time: '30 minutes',
      description: 'Lorem ipsum', public: false, user: user)
  end
  let(:food) do
    Food.create(name: 'Apples', measurement_unit: 'pieces', price: 18,
      quantity: 24, user: user)
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      recipe_food = RecipeFood.new(recipe: recipe, food: food, quantity: 2)
      expect(recipe_food).to be_valid
    end

    it 'is not valid without a quantity' do
      recipe_food = RecipeFood.new(recipe: recipe, food: food)
      expect(recipe_food).not_to be_valid
    end

    it 'is not valid without a food' do
      recipe_food = RecipeFood.new(recipe: recipe, quantity: 2)
      expect(recipe_food).not_to be_valid
    end

    it 'is not valid without a recipe' do
      recipe_food = RecipeFood.new(food: food, quantity: 2)
      expect(recipe_food).not_to be_valid
    end
  end

  context 'associations' do
    it 'belongs to recipe' do
      temp = RecipeFood.reflect_on_association(:recipe)
      expect(temp.macro).to eq(:belongs_to)
    end

    it 'belongs to food' do
      temp = RecipeFood.reflect_on_association(:food)
      expect(temp.macro).to eq(:belongs_to)
    end
  end
end
