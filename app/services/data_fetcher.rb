# frozen_string_literal: true

require 'open-uri'

class DataFetcher
  DATA_LINK = 'https://en.wikipedia.org/wiki/Medical_procedure'
  FIRST_IDENTIFIER = ENV.fetch('FIRST_IDENTIFIER', 'Auscultation')
  LAST_IDENTIFIER = ENV.fetch('LAST_IDENTIFIER', 'Screening (medicine)')

  def initialize(fetch = URI.open(DATA_LINK))
    @fetch = fetch
  end

  def call
    html = parse(@fetch)
    create_records(html)
  end

  private

  def parse(html, can_add: false)
    data = Nokogiri::HTML(html)

    data.xpath('//ul//li/a').each_with_object([]) do |node, acc|
      can_add = true if node.text == FIRST_IDENTIFIER
      next unless can_add

      acc << node.text if can_add

      return acc if node.text == LAST_IDENTIFIER
    end
  end

  def create_records(data)
    data.each do |name|
      MedicalProcedure.find_or_create_by(name: name)
    end
  end
end
