class Traveller < ApplicationRecord
  belongs_to :application
  has_one :health_report
end
