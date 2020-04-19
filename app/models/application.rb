# frozen_string_literal: true
class Application < ApplicationRecord
  belongs_to :user
  has_many :houses
  has_many :travellers
  belongs_to :port
end
