# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all
Comment.destroy_all

["users", "artworks", "artwork_shares", "comments"].each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

user1 = User.create!(username: "Thomas")
user2 = User.create!(username: "Anthony")
user3 = User.create!(username: "Vince")
user4 = User.create!(username: "Ernie")
user5 = User.create!(username: "Nic")
user6 = User.create!(username: "Han")
user7 = User.create!(username: "Nick")
user8 = User.create!(username: "Jas")
user9 = User.create!(username: "Paulo")

artwork1 = Artwork.create!(title:"Manhattan", image_url:"sweet and bold", artist_id: user1.id)
artwork2 = Artwork.create!(title:"Soju", image_url:"crips apple", artist_id: user2.id)
artwork3 = Artwork.create!(title:"Mojito", image_url:"sweet and bold", artist_id: user3.id)
artwork4 = Artwork.create!(title:"Cadillac Margarita", image_url:"top shelf, sweet, sour, and refreshing", artist_id: user4.id)
artwork5 = Artwork.create!(title:"May Tai", image_url:"tart and strong cocktail, with a prominent rum flavor and a bit of orange and lime flavor on the backend.", artist_id: user5.id)
artwork6 = Artwork.create!(title:"Moscow Mule", image_url:"Bright and refreshing cocktail.", artist_id: user6.id)
artwork7 = Artwork.create!(title:"Guinness", image_url:"crisp dark beer with a red hue, a balance of bitter and sweet notes, and a dry finish", artist_id: user7.id)

artwork_share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user1.id)
artwork_share2 = ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: user2.id)
artwork_share3 = ArtworkShare.create!(artwork_id: artwork7.id, viewer_id: user3.id)
artwork_share4 = ArtworkShare.create!(artwork_id: artwork6.id, viewer_id: user4.id)

comment1 = Comment.create!(body: "that was so cool dudee", author_id: user5.id, artwork_id: artwork1.id)
comment2 = Comment.create!(body: "that was so not cool", author_id: user3.id, artwork_id: artwork2.id)
comment3 = Comment.create!(body: "what the fiji man", author_id: user2.id, artwork_id: artwork4.id)
comment4 = Comment.create!(body: "yoooo thats nice art", author_id: user1.id, artwork_id: artwork5.id)
comment5 = Comment.create!(body: "you spelled peru wrong man", author_id: user3.id, artwork_id: artwork3.id)
