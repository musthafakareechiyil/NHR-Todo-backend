# frozen_string_literal: true

class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :todos, :status
  end
end
