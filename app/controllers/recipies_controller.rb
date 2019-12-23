class RecipiesController < ApplicationController
  def index
    slug = params[:slug]
    cookies[:slugs] = [] if cookies[:slugs].nil?
    cookies[:slugs] << slug if slug.present?
    @recipies = Dir.glob('/home/daniel/recipes_for_erin/app/assets/recipies/*.json').sort
  end
end
