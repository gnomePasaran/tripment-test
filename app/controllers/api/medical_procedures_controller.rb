# frozen_string_literal: true

class Api::MedicalProceduresController < ApplicationController
  def index
    render json: MedicalProcedureSerializer.new(medical_procedures)
  end

  private

  def medical_procedures
    @medical_procedures = MedicalProcedure.search(
      params[:q],
      fields: [{ name: :word_start }, { name: :word_middle }],
      misspellings: false
    )
  end
end
