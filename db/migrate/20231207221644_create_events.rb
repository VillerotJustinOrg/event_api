class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.belongs_to :event_types
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :description
      t.string :address
      t.string :phone
      t.string :website
      t.string :image
      t.float :rating

      t.timestamps
    end
  end
end
