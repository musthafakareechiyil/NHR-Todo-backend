# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :find_todo, only: %i[update destroy]

  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: { message: 'Todo successfully created' }, status: :created
    else
      render json: { error: 'Could not create Todo', details: @todo.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @todo.update(todo_params)
      render json: { message: 'Todo updated successfully' }, status: :ok
    else
      render json: { error: 'Todo update failed', details: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    render json: { message: 'Todo destroyed successfully' }, status: :ok
  end

  private

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :status)
  end
end
