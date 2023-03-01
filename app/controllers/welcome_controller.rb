class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - Jackson Pires[COOKIE]"
    session[:curso] = "Curso de Ruby on Rails - Jackson Pires[SESSION]"
    @meu_nome = params[:nome]
    @nome_curso = params[:curso]
  end
end
