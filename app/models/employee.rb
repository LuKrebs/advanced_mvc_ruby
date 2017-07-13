class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(properties = {})
    @id = properties[:id]
    @username = properties[:username]
    @password = properties[:password]
    @role = properties[:role]
  end

  def manager?
    @role == "manager" ? true : false
  end

  def delivery_guy?
    @role == "delivery_guy" ? true : false
  end
end
