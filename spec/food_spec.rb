require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'dil', email: 'dil@gamail.com', password: 'dil',
    password_confirmation: 'dil')
  }

  context 'validations' do
    it 'is valid with valid attributes' do
      food = Food.new(name: 'apple', measurement_unit: 'pieces', price: 18,
        quantity: 24, user: user)
      expect(food).to be_valid
    end
    
    it 'is not valid without a name' do
      food = Food.new(measurement_unit: 'pieces', price: 18,
        quantity: 24, user: user)
        expect(food).not_to be_valid
      end
      
      it 'is not valid without price' do
        food = Food.new(name: 'apple', measurement_unit: 'pieces',
        quantity: 24, user: user)
        expect(food).not_to be_valid
      end
      
      it 'is not valid without quantity' do
      food = Food.new(name: 'apple', measurement_unit: 'pieces', price: 18,
        user: user)
      expect(food).not_to be_valid
    end
    it 'is not valid without meaurement unit' do
      food = Food.new(name: 'apple', price: 18,
        quantity: 24, user: user)
      expect(food).not_to be_valid
    end
  end

  context 'associations' do
    it 'belongs to user' do
      temp = Food.reflect_on_association(:user)
      expect(temp.macro).to eq(:belongs_to)
    end

    it 'has many recipies of foods' do
      temp = Food.reflect_on_association(:recipes_foods)
      expect(temp.macro).to eq(:has_many)
    end
  end
end