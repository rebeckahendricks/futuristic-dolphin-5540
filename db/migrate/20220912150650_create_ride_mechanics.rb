class CreateRideMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_mechanics do |t|
      t.references :ride, null: false, foreign_key: true
      t.references :mechanic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
