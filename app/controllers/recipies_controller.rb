class RecipiesController < ApplicationController
  def index
    slug_to_add, slug_to_remove = nil, nil

    existing_slugs = session[:slugs] || []

    if params[:slug].present?
      if params[:slug][0] == '-'
        slug_to_remove = params[:slug][1..-1]
        index = existing_slugs.index(slug_to_remove)
        existing_slugs.delete_at(index) if index
      else
        slug_to_add = params[:slug]
        existing_slugs = existing_slugs + [slug_to_add]
      end
    end

    session[:slugs] = (existing_slugs).compact
    @recipies = Dir.glob('app/assets/recipies/*.json')
                   .map { |r| JSON.parse(File.read(r)) }
                   .sort_by { |r| r['name'] }
  end

  def show
    file = File.read("app/assets/recipies/#{params[:id]}.json")
    @recipe = JSON.parse(file)
  end
end
