namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o Banco de Dados...") {%x(rails db:drop)}
      show_spinner("Criando Banco de Dados...") {%x(rails db:create)}
      show_spinner("Migrando Bando de Dados...") {%x(rails db:migrate)}
      show_spinner("Populando Banco de Dados...") {%x(rails db:seed)}
    else
      puts 'Voce nao esta no ambiente de desenvolvimento'
    end
  end


desc "Cadastro de Moedas"
task add_coins: :enviroment do
  show_spinner("Cadastrando Moedas...") do
    coins = [
        {
            description: "Bitcoin", 
            acronym: "BTC",
            url_image: "https://upload.wikimedia.org/wikipedia/commons/5/50/Bitcoin.png"
        },
        {
            description: "Ethereum", 
            acronym: "ETH",
            url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png"
        },
        {
            description: "Dash", 
            acronym: "DASH",
            url_image: "https://cryptonaute.fr/wp-content/uploads/2020/05/Logo-de-la-crypto-DASH.png"
        }
    ]

    coins.each do |coin|
        Coin.find_or_create_by!(coin)
    end
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

