# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MedicalProcedure, type: :model do
  subject { build(:medical_procedure) }

  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_uniqueness_of(:name) }
end
