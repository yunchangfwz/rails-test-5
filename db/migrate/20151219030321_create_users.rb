class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :dob 
      t.integer :years_of_exp
      t.timestamps
    end
  end
end
