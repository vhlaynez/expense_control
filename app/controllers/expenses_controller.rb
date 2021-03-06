# frozen_string_literal: true

# Class that deals with expenses data
class ExpensesController < ApplicationController
  before_action :set_expenses, only: %i[index]
  before_action :set_expense, only: %i[show destroy update]

  def index
    render json: @expenses
  end

  def show
    render json: @expense
  end

  def create
    Expense.create!(expense_params)
  end

  def destroy
    @expense.destroy
  end

  def update
    @expense.update!(expense_params)
  end

  private

  def set_expenses
    @expenses = Expense.all
  end

  def set_expense
    @expense = Expense.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render json: { error_message: 'expense not found' }, status: :not_found
  end

  def expense_params
    params.permit(:title, :amount_cents, :place, :date)
  end
end
