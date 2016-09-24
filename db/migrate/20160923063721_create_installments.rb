class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.integer :building_id
      t.float :amount
      t.date :installment_date
      t.string :status
      t.text :details

      t.timestamps null: false
    end
  end
end
