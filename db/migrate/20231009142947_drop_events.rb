class DropEvents < ActiveRecord::Migration[7.0]
  def up
    drop_table :events
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
