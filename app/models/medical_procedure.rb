# frozen_string_literal: true

class MedicalProcedure < ApplicationRecord
  include Elasticsearch::MedicalProcedure

  validates :name, presence: true, uniqueness: { case_sensitive: true }
end
