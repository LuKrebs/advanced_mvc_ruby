require 'csv'
require_relative '../models/customer'

class CustomerRepository

  def initialize(csv_path)
    @customers = []
    @csv_path = csv_path
    @csv_options = { headers: :first_row, header_converters: :symbol }
    if File.exist?(csv_path)
      CSV.foreach(csv_path, @csv_options) do |row|
        properties = { id: row[:id].to_i, name: row[:name], address: row[:address] }
        @customers << Customer.new(properties)
      end
    end
  end

  def all
    @customers
  end

  def add(customer)
    @customers.empty? ? customer.id = 1 : customer.id = @customers.last.id + 1
    @customers << customer
    save_change
  end

  def save_change
    CSV.open(@csv_path, 'wb', write_headers: true, headers: ["id", "name", "address"]) do |csv|
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def find(number)
    @customers.find { |user| user.id == number }
  end
end
