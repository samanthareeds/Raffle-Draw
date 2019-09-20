class CreateRaffles < ActiveRecord::Migration[5.2]
  def change
    create_table :raffles do |t|
      t.string :name

      t.timestamps
    end
  end
end
