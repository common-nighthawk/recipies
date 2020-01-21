class ListsController < ApplicationController
  def create
    recipies = session[:slugs].map do |slug|
      file = File.read("app/assets/recipies/#{slug}.json")
      JSON.parse(file)
    end

    list = List.new(name: "List for #{recipies.map { |r| r['name'] }} from #{Time.now.getlocal(TZInfo::Timezone.get('US/Pacific').current_period.offset.utc_total_offset).strftime("%m-%d-%Y @ %l:%M %P")}")

    recipies.each do |recipe|
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
