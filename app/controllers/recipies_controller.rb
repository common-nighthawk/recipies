class RecipiesController < ApplicationController
  def index
    @recipies = Dir.glob('/home/daniel/recipes_for_erin/app/assets/recipies/*.json').sort
  end
end
