# frozen_string_literal: true

class Api::MedicalProceduresController < ApplicationController
  def index
    @result = MedicalProcedure.search(params[:q], fields: [{ name: :word_start }, { name: :word_middle }])
    render json: MedicalProcedureSerializer.new(@result)
  end
end
