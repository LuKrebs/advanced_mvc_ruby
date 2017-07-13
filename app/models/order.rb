class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer

  def initialize(properties = {})
    @id = properties[:id]
    @delivered = properties[:delivered] || false
    @meal = properties[:meal]
    @employee = properties[:employee]
    @customer = properties[:customer]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
