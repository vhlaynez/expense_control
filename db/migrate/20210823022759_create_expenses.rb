# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.integer :amount_cents
      t.string :place
      t.datetime :date

      t.timestamps
    end
  end
end
