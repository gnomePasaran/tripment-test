# frozen_string_literal: true

class MedicalProcedureSerializer
  include JSONAPI::Serializer

  attributes :name
end
