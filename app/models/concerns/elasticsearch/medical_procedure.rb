# frozen_string_literal: true

module Elasticsearch::MedicalProcedure
  extend ActiveSupport::Concern

  included do
    searchkick word_start: [:name], word_middle: [:name]

    def search_data
      { name: name.downcase }
    end
  end
end
