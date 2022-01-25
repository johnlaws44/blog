class AddStatusToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :status, :string
  end
end
