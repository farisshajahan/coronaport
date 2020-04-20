class House < ApplicationRecord
  belongs_to :panchayat
  belongs_to :application
  enum status: {accepted: "accepted", rejected: "rejected"}
end
