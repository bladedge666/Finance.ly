# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Record.create(title: "First record from seeds.rb", amount: 1000, date: Date.today)

Record.create(title: "Second record from seeds.rb", amount: 2000, date: Date.today)

Record.create(title: "Third record from seeds.rb", amount: -3000, date: Date.today)