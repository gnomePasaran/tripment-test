# frozen_string_literal: true

class MedicalProcedure < ApplicationRecord
  searchkick word_start: [:name], word_middle: [:name]

  validates :name, presence: true, uniqueness: { case_sensitive: true }

  def search_data
    { name: name.downcase }
  end
end
