class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build()
    @recipe.ingredients.build()
  end

  def create
    @recipe = Recipe.create(recipe_params)
    # @recipe.ingredients.build(ingredients_attributes)
    redirect_to recipe_path(@recipe)
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :ingredients_attributes => [:quantity, :name])
  end
end
