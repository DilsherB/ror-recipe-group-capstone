class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.all
    @food = Food.all
    @total_price = current_user.sum(@recipe.recipe_food.includes([:food]))
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipes_foods.all.sort_by { |recipe_food| recipe_food.food.name }
    @food = Food.all
    @total_price = 0
    @recipe_food.each do |fd|
      @total_price += fd.quantity.to_f * fd.food.price.to_f
    end
  end
end
