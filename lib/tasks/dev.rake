namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o Banco de Dados...") {%x(rails db:drop)}
      show_spinner("Criando Banco de Dados...") {%x(rails db:create)}
      show_spinner("Migrando Bando de Dados...") {%x(rails db:migrate)}
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts 'Voce nao esta no ambiente de desenvolvimento'
    end
  end


desc "Cadastro de Moedas"
task add_coins: :environment do
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
        },
        {
          description: "IOTA", 
          acronym: "IOT",
          url_image: "https://static.crypto.com/token/icons/iota/color_icon.png"
      },
      {
        description: "Zcash", 
        acronym: "ZEC",
        url_image: "https://z.cash/wp-content/uploads/2018/10/zcash-logo-fullcolor-512sq.png"
      },
      {
        description: "Tether", 
        acronym: "TET",
        url_image: "https://assets-global.website-files.com/5e73a1e3ba24f2cd5dd2232a/620b321d26aa0f1bbbe56a28_usdt2.png"
      },
      {
        description: "Dogecoin", 
        acronym: "DOGE",
        url_image: "https://cdn-icons-png.flaticon.com/512/6001/6001356.png"
      }
    ]

    coins.each do |coin|
        Coin.find_or_create_by!(coin)
    end
  end
end

desc "Cadastra os Tipos de Mineração"
task add_mining_types: :environment do
  show_spinner("Cadastrando Tipos de Mineração...") do
    mining_types = [
      {description: "Proof of Work", acronym: "PoW"},
      {description: "Proof of Stake", acronym: "PoS"},
      {description: "Proof of Capacity", acronym: "PoC"}
    ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
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

