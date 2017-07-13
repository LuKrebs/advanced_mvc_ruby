class View
  def list_undelivered(under_orders)
    under_orders.each do |order|
      puts "#{order.meal} #{order.employee.username} #{order.customer.name}"
    end
  end

  def getting_info
    puts "Please, enter the meal id:"
    meal_id = gets.chomp

    puts "Please, enter the customer id"
    customer_id = gets.chomp

    puts "Please, enter the employee id"
    employee_id = gets.chomp

    { meal: meal_id.to_i, customer: customer_id.to_i, employee: employee_id.to_i }
  end

  def orders_by_employee(x)
    x.each do |z|
      puts "#{z.customer.name} ~> #{z.meal.name}"
    end
  end

  def marking_order
    puts "What order do you want to mark as deliver?"
    gets.chomp.to_i
  end

  def show_customers(customers)
    print `clear`
    customers.each_with_index do |customer, index|
      puts "#{index + 1} ~> #{customer.name}"
    end
  end

  def ask_user
    puts "Please, the name"
    user_name = gets.chomp

    puts "Please, the address"
    user_address = gets.chomp

    { name: user_name, address: user_address }
  end

  def show_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} ~> #{meal.name}"
    end
  end

  def ask_user
    puts "Please, the name"
    meal_name = gets.chomp

    puts "Please, price"
    meal_price = gets.chomp

    { name: meal_name, price: meal_price.to_i }
  end

  def ask_username
    puts "username?"
    gets.chomp
  end

  def ask_password
    puts "password?"
    gets.chomp
  end

  def successfully_signed_in(employee)
    puts "Welcome, #{employee.username}!"
  end

  def failed_authentication
    puts "Failed authentication! Try again!"
  end

end
