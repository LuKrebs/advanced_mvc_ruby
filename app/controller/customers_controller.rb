require_relative '../views/view'

class CustomersController
  def initialize(repository)
    @repository = repository
    @view = View.new()
  end

  def list
    customers = @repository.all
    @view.show_customers(customers)
  end

  def add
    user_answer = @view.ask_user
    user = Customer.new(user_answer)
    @repository.add(user)
  end
end
