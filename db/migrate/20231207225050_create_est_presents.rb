class CreateEstPresents < ActiveRecord::Migration[7.1]
  def change
    create_table :est_presents do |t|
      t.datetime :time

      t.timestamps
    end
  end
end
