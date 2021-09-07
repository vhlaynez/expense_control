# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :set_expenses, only: %i[index]

  def index
    render json: @expenses
  end

  private

  def set_expenses
    @expenses = Expense.all
  end

  def params
    param.permit(:id)
  end
end
