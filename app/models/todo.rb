class Todo < ActiveRecord::Base
  def due_today
    due_date == Date.today
  end

  def overdue
    due_date > Date.today
  end

  def due_later
    due_date < Date.today
  end

  def to_string
    is_completed = completed ? "[X]" : "[]"
    "#{due_date} #{todo_text} #{is_completed}"
  end
end
