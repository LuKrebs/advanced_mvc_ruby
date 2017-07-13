require_relative '../models/order'
require_relative '../views/view'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @view = View.new()
  end

  def list_undelivered_orders
    und_orders = @order_repository.undelivered_orders
    @view.list_undelivered(und_orders)
  end

  def add
    info = @view.getting_info
    meal = @meal_repository.find(info[:meal])
    customer = @customer_repository.find(info[:customer])
    employee = @employee_repository.find(info[:employee])

    properties = { meal: meal, employee: employee, customer: customer }
    order = Order.new(properties)
    @order_repository.add(order)
  end

  def list_my_orders(employee)
    if employee.role == 'manager'
      x = @order_repository.all
      @view.orders_by_employee(x)
    else
      und_orders = @order_repository.undelivered_orders
      id_emp = employee.id
      x = und_orders.select { |order| order.employee.id == id_emp}
      @view.orders_by_employee(x)
    end
  end

  def mark_as_delievered
    order_done = @view.marking_order
    @order_repository.mark_as_done(order_done)
  end
end
