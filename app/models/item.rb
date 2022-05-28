# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
