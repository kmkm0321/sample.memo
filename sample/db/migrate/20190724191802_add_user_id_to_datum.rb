class AddUserIdToDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :data, :user_id, :integer
  end
end
