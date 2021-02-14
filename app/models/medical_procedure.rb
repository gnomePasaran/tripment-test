# frozen_string_literal: true

class MedicalProcedure < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }
end
