# frozen_string_literal: true

module TestHelpers
  def json_response
    result = JSON.parse(response.body)
    return result.deep_symbolize_keys if result.respond_to?(:deep_symbolize_keys)

    result.map! do |item|
      item.respond_to?(:deep_symbolize_keys) ? item.deep_symbolize_keys : item
    end
  end
end
