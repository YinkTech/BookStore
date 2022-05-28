# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user

  has_many :items, dependent: :destroy
end
