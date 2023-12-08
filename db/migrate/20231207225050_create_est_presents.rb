class CreateEstPresents < ActiveRecord::Migration[7.1]
  def change
    create_table :est_presents do |t|
      t.datetime :time

      # Assosiation
      t.belongs_to :persons
      t.belongs_to :event

      t.timestamps
    end
  end
end
