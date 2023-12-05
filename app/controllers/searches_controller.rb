class SearchesController < ApplicationController
  before_action :authenticate_user!

  def self.search_for(content, method)
    # 検索のロジックを実装する
  end

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    # 選択したモデルに応じて検索を実行
    if @model  == "user"
      @records = User.search_for(@content, @method)
    else
      @records = Book.search_for(@content, @method)
    end
  end
end
