class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(properties = {})
    @id = properties[:id]
    @name = properties[:name]
    @address = properties[:address]
  end
end
