class ParsersController < ApplicationController
  respond_to :html
  def index
  end

  def parse_walmart
    respond_with parser do |format|
      format.html { render partial: 'parsers/response', locals: { result: parser }, layout: false if request.xhr? }
    end
  end

  private
  def parser
    @parser ||= ParseService.build_document(product_id: params[:product_id], search_string: params[:search_string])
  end
end
