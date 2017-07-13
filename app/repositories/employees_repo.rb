require 'csv'
require_relative '../models/employee'

class EmploreeRepository

  def initialize(csv_path)
    @employees = []
    @csv_path = csv_path
    @csv_options = { headers: :first_row, header_converters: :symbol }
    if FIle.exist?(csv_path)
      CSV.foreach(csv_path, @csv_options) do |row|
        properties = { id: row[:id].to_i, username: row[:username] password: row[:password], role: row[:role] }
        @employees << employee.new(properties)
      end
    end
  end

  def find(number)
    @employees.find { |employee| employee.id == numer}
  end

  def all_delivery_guys
    @employees.select { |employee| employee.role == "delivery" }
  end

  def find_by_username(name_to_find)
    @employees.find { |employee| employee.username == name_to_find }
  end
end
