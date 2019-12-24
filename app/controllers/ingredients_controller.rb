class IngredientsController < ApplicationController
  def index
    slugs = Array.wrap(cookies[:slugs])
    @recipies = Dir.glob('app/assets/recipies/*.json').sort
  end
end
