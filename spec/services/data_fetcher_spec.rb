# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DataFetcher, type: :model do
  subject(:data_fetcher) { described_class.new(data).call }

  let(:data) { File.open('spec/fixtures/data/medical_procedures.html') }

  it 'success' do
    expect { data_fetcher }.to change(MedicalProcedure, :count).from(0).to(170)
    expect(data_fetcher.first).to eq described_class::FIRST_IDENTIFIER
    expect(data_fetcher.last).to eq described_class::LAST_IDENTIFIER
  end
end
