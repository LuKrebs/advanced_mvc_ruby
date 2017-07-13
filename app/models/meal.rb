class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(properties = {})
    @id = properties[:id]
    @name = properties[:name]
    @price = properties[:price]
  end
end
