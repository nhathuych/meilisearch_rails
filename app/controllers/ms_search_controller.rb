class MsSearchController < ApplicationController
  def search
    @articles = Article.includes(:addresses)
    @articles = @articles.search(params[:query], sort: [ "id:asc" ]) if params[:query].present?

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          "js-articles",
          partial: "articles/articles",
          locals: { articles: @articles }
        )
      end
    end
  end
end
