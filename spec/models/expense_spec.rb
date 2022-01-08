# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'when validating amount_cents' do
    context 'when data is valid' do
      context 'when is greater than zero' do
        it 'validates without errors' do
          expense = described_class.new(title: 'test', date: DateTime.now,
                                          amount_cents: 1)
          expect(expense).to be_valid(:amount_cents)
        end
      end

      context 'when is less than 100_000_000' do
        it 'validates without errors' do
          expense = described_class.new(title: 'test', date: DateTime.now,
                                          amount_cents: 100_000)
          expect(expense).to be_valid(:amount_cents)
        end
      end
    end

    context 'when data is invalid' do
      context 'when is less than zero' do
        it 'returns error message' do
          expense = described_class.new(title: 'test', date: DateTime.now,
                                          amount_cents: -1)
          expect(expense).not_to be_valid
          expect(expense.errors.messages).to include :amount_cents
        end
      end

      context 'when is greater than 100_000_000' do
        it 'returns error message' do
          expense = described_class.new(title: 'test', date: DateTime.now,
                                          amount_cents: 100_000_001)
          expect(expense).not_to be_valid
          expect(expense.errors.messages).to include :amount_cents
        end
      end

      context 'when is not present' do
        it 'returns error message' do
          expense = described_class.new(title: 'test', date: DateTime.now)
          expect(expense).not_to be_valid
          expect(expense.errors.messages).to include :amount_cents
        end
      end

      context 'when is not a number' do
        it 'returns error message' do
          expense = described_class.new(title: 'test', date: DateTime.now,
                                          amount_cents: 'test not a number')
          expect(expense).not_to be_valid
          expect(expense.errors.messages).to include :amount_cents
        end
      end
    end
  end

  context 'when validating title' do
    context 'when it is present' do
      it 'validates without errors' do
        expense = described_class.new(title: 'test', date: DateTime.now,
                                        amount_cents: 1)
        expect(expense).to be_valid(:title)
      end
    end

    context 'when it is not present' do
      it 'returns error message' do
        expense = described_class.new(date: DateTime.now)
        expect(expense).not_to be_valid
        expect(expense.errors.messages).to include :title
      end
    end
  end

  context 'when validating date' do
    context 'when it is a date' do
      it 'validates without errors' do
        expense = described_class.new(title: 'test', date: DateTime.now,
                                        amount_cents: 1)
        expect(expense).to be_valid(:title)
      end
    end

    context 'when it is not a date' do
      it 'returns error message' do
        expense = described_class.new(title: 'test', date: 'test date',
                                        amount_cents: 1)
        expect(expense).not_to be_valid
        expect(expense.errors.messages).to include :date
      end
    end
  end
end
