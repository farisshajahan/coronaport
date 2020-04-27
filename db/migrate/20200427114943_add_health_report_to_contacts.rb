class AddHealthReportToContacts < ActiveRecord::Migration[6.0]
  def change
    change_table(:contacts) do |t|
      t.boolean "has_diabetes"
      t.boolean "has_hyper_tension"
      t.boolean "has_heart_disease"
      t.boolean "has_kidney_disease"
      t.boolean "is_pregnant"
      t.string "recent_history"
      t.string "symptoms"
      t.boolean "primary_contact"
      t.boolean "has_tested"
      t.boolean "was_positive"
      t.string "test_type"
    end
  end
end
