class TodosController < ApplicationController
  def index
    render plain: Todo.all.map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def show
    todo = Todo.find(params[:id])
    render plain: todo.to_pleasant_string
  end

  def edit
    todo = Todo.find(params[:id])
    todo.completed = true
    render plain: todo.to_pleasant_string
  end

  def create
    todotext = params[:todo_text]
    tododate = params[:due_date]
    todo = Todo.create!(todo_text: todotext, due_date: Date.today + tododata, completed: false)
    render plain: todo.to_pleasant_string
  end
end
