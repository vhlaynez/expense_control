class ExpenseController < ApplicationController
    before_action :index, only: %i[set_expenses]
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
