# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    title { 'teste expense' }
    amount_cents { 1000 }
    place { 'location' }
    date { DateTime.now }
  end
end
