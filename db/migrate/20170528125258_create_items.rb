class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :type
      t.integer :priority
      t.string :client
      t.string :seller
      t.date :created
      t.integer :price
      t.integer :paid
      t.text :description
      t.date :accepted_q
      t.date :accepted_c
      t.date :accepted_p
      t.date :start_date
      t.date :end_date
      t.string :status
    end
  end
end
