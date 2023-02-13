class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome]
    @nome_curso = params[:curso]
  end
end
