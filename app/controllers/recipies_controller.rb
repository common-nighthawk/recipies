class RecipiesController < ApplicationController
  def index
    slug_to_add, slug_to_remove = nil, nil

    existing_slugs = session[:slugs] || []

    if params[:slug].present?
      if params[:slug][0] == '-'
        slug_to_remove = params[:slug][1..-1]
        existing_slugs = existing_slugs - [slug_to_remove]
      else
        slug_to_add = params[:slug]
        existing_slugs = existing_slugs + [slug_to_add]
      end
    end

    session[:slugs] = (existing_slugs).compact.uniq
    @recipies = Dir.glob('app/assets/recipies/*.json').sort
  end

  def show
    file = File.read("app/assets/recipies/#{params[:id]}.json")
    @recipe = JSON.parse(file)
  end
end
