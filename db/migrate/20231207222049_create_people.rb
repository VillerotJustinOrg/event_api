class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :pseudo
      t.string :avatarimg
      t.string :phone
      t.string :mail
      t.string :mdp

      t.timestamps
    end
  end
end
