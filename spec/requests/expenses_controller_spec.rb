# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpensesController, type: :request do
  describe '#index' do
    subject(:parsed_response) { JSON.parse(response.body) }

    context 'when there are no expenses' do
      before { get expenses_path }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns an empty array' do
        expect(parsed_response).to eq([])
      end
    end

    context 'when there are auctions' do
      before do
        create_list(:expense, 5)
        get expenses_path
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns all expenses' do
        expect(parsed_response.count).to eq(5)
      end
    end
  end

  describe '#update' do
    context 'when the expense is not found' do
      it 'returns not found' do
        put expense_path(1), params: { title: 'teste 2' }
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when the expense exists' do
      let(:expense) { create :expense }

      before { put expense_path(expense.id), params: { title: 'teste 2' } }

      it 'updates data' do
        expect(Expense.first.title).to eq('teste 2')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
