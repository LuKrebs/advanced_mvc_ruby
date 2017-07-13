require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file)
    @meals = []
    @csv_file = []
    @csv_options = { headers: :first_row, header_converters: :symbol }
    if File.exist?(csv_file)
      CSV.foreach(csv_file, @csv_options) do |row|
        properties = { id: row[:id].to_i, name: row[:name], price: row[:price].to_i }
        @meals << Meal.new(properties)
      end
    end
  end

  def all
    @meals
  end

  def add(meal)
    @meals.empty ? meal.id = 1 : meal.id = @meals.last.id + 1
    @meals << meal
    save_change
  end

  def save_change
    CSV.open(@csv_file, 'wb', write_headers: true, headers: ["id", "name", "price"]) do |csv|
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def find(number)
    @meals.find { |meal| food.id == number }
  end
end
