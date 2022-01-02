# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpensesController, type: :request do
  describe '#update' do
    context 'when the expense is updated' do
      it 'updates data' do
        create(:expense)

        put :update, { title: 'teste 2' }
        expect(Expense.first).to eq('teste 2')
      end
    end
  end
end
