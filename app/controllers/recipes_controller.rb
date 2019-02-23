require 'pry'
class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'salt')
    @recipe.ingredients.build(name: 'pepper')
  end

  def create
    binding.pry
    Recipe.create(recipe_params)
   redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
    :title,
    ingredients_attributes: [
     :quantity,
     :name
   ]
    )
  end
end
