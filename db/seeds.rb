# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Criando as moedas..."

Coin.create!(
    description: "Bitcoin", 
    acronym: "BTC",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/5/50/Bitcoin.png"

)

Coin.create!(
    description: "Ethereum", 
    acronym: "ETH",
    url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png"

)

Coin.create!(
    description: "Dash", 
    acronym: "DASH",
    url_image: "https://cryptonaute.fr/wp-content/uploads/2020/05/Logo-de-la-crypto-DASH.png"

)

puts "Moedas caadastradas com sucesso"