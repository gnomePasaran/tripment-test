# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MedicalProceduresController, type: :request do
  describe 'GET #index' do
    subject(:perform_request) { get '?q=pos' }

    let!(:mp_1) do
      VCR.use_cassette('medical_procedures/index/mp_1') do
        create(:medical_procedure, name: 'Posqwerttyuio', id: 916)
      end
    end

    let!(:mp_2) do
      VCR.use_cassette('medical_procedures/index/mp_2') do
        create(:medical_procedure, name: 'Qwertyposuiop', id: 917)
      end
    end

    before do
      VCR.use_cassette('medical_procedures/index/mps') do
        create(:medical_procedure, name: 'randomname', id: 918)
      end
    end

    it 'renders proper results' do
      VCR.use_cassette('medical_procedures/index/request') do
        perform_request
      end

      expect(response).to be_ok
      expect(json_response[:data].size).to eq 2
      expect(json_response[:data][0][:attributes][:name]).to eq mp_1.name
      expect(json_response[:data][1][:attributes][:name]).to eq mp_2.name
    end
  end
end
