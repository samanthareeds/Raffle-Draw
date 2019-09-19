class CreateDraws < ActiveRecord::Migration[5.2]
  def change
    create_table :draws do |t|
      t.string :email
      t.text :drawtype

      t.timestamps
    end
  end
end
