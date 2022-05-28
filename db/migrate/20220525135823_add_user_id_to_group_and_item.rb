# frozen_string_literal: true

class AddUserIdToGroupAndItem < ActiveRecord::Migration[7.0]
  def change
    add_column :group_and_items, :user_id, :integer
    add_index :group_and_items, :user_id
  end
end
