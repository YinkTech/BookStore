# frozen_string_literal: true

class AddGroupIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :group_id, :integer
    add_index :items, :group_id
  end
end
