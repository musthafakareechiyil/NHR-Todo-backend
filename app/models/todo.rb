# frozen_string_literal: true

class Todo < ApplicationRecord
  enum status: %i[pending completed incomplete]

  validates :title, presence: true
end
