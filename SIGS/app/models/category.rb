# frozen_string_literal: true

# Class category
class Category < ApplicationRecord
  has_and_belongs_to_many :room
  has_and_belongs_to_many :school_room
end
