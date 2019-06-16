class CreateRegistros < ActiveRecord::Migration[5.2]
  def change
    create_table :registros do |t|
      t.float :gasto
      t.string :descripcion
      t.boolean :destino
      t.string :user_id
      t.timestamps
    end
  end
end
