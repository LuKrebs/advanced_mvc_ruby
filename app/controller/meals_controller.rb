require_relative '../views/view'

class MealsController
  def initialize(repository)
    @repository = repository
    @view = View.new()
  end

  def list
    meals = @repository.all
    @view.show_meals(meals)
  end

  def add
    user_anser = @view.ask_user
    meal = Meal.new(user_anser)
    @repository.add(meal)
  end
end
