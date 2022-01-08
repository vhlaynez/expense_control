# frozen_string_literal: true

class Expense < ApplicationRecord
  monetize :amount_cents, disable_validation: true
  register_currency :brl

  validates :amount_cents, presence: true, numericality: {
    greater_than: 0,
    less_than: 100_000_000,
    message: 'Invalid data'
  }
  validates :title, presence: true
  validates :date, date: true
end
