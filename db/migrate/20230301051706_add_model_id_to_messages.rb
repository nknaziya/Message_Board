class AddModelIdToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :model_id, :integer
  end
end
