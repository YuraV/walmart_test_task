class ParseService
  require 'open-uri'
  WALMART_URL = "https://www.walmart.com/reviews/product".freeze
  SELECTOR = ".customer-review-text".freeze

  attr_accessor :product_id, :search_string

  def self.build_document(options)
    new(options).build_document
  end

  def initialize(options = {})
    @product_id = options[:product_id]
    @search_string = options[:search_string]
  end

  def build_document
    document.css(SELECTOR)
                 .map{ |el| el.text if el.text.include?(search_string) }.compact
  end

  private

  def document
    Nokogiri::HTML(open("#{WALMART_URL}/#{product_id}"))
  end
end


