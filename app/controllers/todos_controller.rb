class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    # debugger
    @todo = Todo.find(params[:id])
    @todo.completed = params[:completed]
    @todo.save
    redirect_to action: "index"
  end

  def create
    todo_text = params[:todo_text]
    todo_date = DateTime.parse(params[:due_date])
    @newtodo = Todo.create!(todo_text: todo_text, due_date: todo_date, completed: false)
    redirect_to action: "index"
  end

  def new
    @todo = Todo.new
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to action: "index"
  end
end
