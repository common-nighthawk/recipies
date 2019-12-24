class ListsController < ApplicationController
  def create
    list = List.new(name: "List created on #{Time.now.strftime("%Y-%m-%d @ %H:%M")}")

    session[:slugs].each do |slug|
      file = File.read("app/assets/recipies/#{slug}.json")
      recipe = JSON.parse(file)

      recipe['ingredients_full'].each do |ingredient|
        list.items.build(
          name: ingredient['name'],
          quantity: ingredient['quantity'],
          measurement_unit: ingredient['measurementUnit'],
        )

      end
    end
    list.save!
    redirect_to :action => "show", :id => list.id
  end

  def show
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
  end
end
