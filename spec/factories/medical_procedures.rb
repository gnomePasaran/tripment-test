# frozen_string_literal: true

# require 'faker'

FactoryBot.define do
  factory :medical_procedure do
    sequence(:name) { |n| "MedicalProcedure-#{n}" }
  end
end
