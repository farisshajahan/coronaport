class Vehicle < ApplicationRecord
  enum seats: { five: "five", seven: "seven" }
  belongs_to :application
end
