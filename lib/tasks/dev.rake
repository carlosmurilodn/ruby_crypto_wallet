namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o Banco de Dados") {%x(rails db:drop)}
      show_spinner("Criando Banco de Dados...") {%x(rails db:create)}
      show_spinner("Migrando Bando de Dados...") {%x(rails db:migrate)}
      show_spinner("Populando Banco de Dados...") {%x(rails db:seed)}
    else
      puts 'Voce nao esta no ambiente de desenvolvimento'
    end
  end
  
private
    def show_spinner(msg_start, msg_end = "Concluido!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end

end
