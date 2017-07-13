require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_path, meal_repository, employee_repository, customer_repository)
    @csv_path = csv_path
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders = []
    if File.exist?(csv_path)
      CSV.foreach(csv_path, headers: :first_row, header_converters: :symbol) do |row|
        string_to_boolean = row[:delivered] == "true" ? true : false
        @orders << Order.new(id: row[:id].to_i,
                             delivered: string_to_boolean,
                             meal: @meal_repository.find(row[:meal_id].to_i),
                             employee: @employee_repository.find(row[:employee_id].to_i),
                             customer: @customer_repository.find(row[:customer_id].to_i))
      end
    end
  end

  def undelivered_orders
    @orders.select { |order| order.delivered? == false }
  end

  def add(order)
    @orders.empty? ? order.id = 1 : order.id = @orders.last.id + 1
    @orders << order
    save_change
  end

  def all
    @orders
  end

  def mark_as_done(order_id)
    @orders.each { |my_order| my_order.deliver! if order_id == my_order.id }
  end

  def save_change
    headers = ["id", "delivered", "meal_id", "employee_id", "customer_id"]
    CSV.open(@csv_path, 'wb', write_headers: true, headers: headers) do |csv|
      @orders.each do |order|
        csv << [order.id order.delivered?, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end
end
