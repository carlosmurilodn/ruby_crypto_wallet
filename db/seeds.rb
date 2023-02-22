# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas")
spinner.auto_spin

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

spinner.success("(Moedas cadastradas com sucesso!)")




=begin
Coin.create!(
    [
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
)
=end