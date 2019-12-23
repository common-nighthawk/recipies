class IngredientsController < ApplicationController
  def index
    slugs = Array.wrap(cookies[:slugs])
    @recipies = Dir.glob('/home/daniel/recipes_for_erin/app/assets/recipies/*.json').sort
  end
end
