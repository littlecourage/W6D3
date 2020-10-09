# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

user1 = User.create({ username: 'Bob' })
user2 = User.create({ username: 'Andy' })
user3 = User.create({ username: 'Alvin' })

artwork1 = Artwork.create({ title: 'Untitled', image_url: 'bob.com/untitled', artist_id: user1.id })
artwork2 = Artwork.create({ title: 'Self Portrait', image_url: 'andy.com/my_art', artist_id: user2.id })
artwork3 = Artwork.create({ title: 'Hey Programmers', image_url: 'alvin.com/art', artist_id: user3.id })

shares1 = ArtworkShare.create({ artwork_id: artwork1.id, viewer_id: user3.id })
shares2 = ArtworkShare.create({ artwork_id: artwork1.id, viewer_id: user2.id })
shares3 = ArtworkShare.create({ artwork_id: artwork2.id, viewer_id: user1.id })
shares4 = ArtworkShare.create({ artwork_id: artwork2.id, viewer_id: user3.id })
shares5 = ArtworkShare.create({ artwork_id: artwork3.id, viewer_id: user1.id })
shares6 = ArtworkShare.create({ artwork_id: artwork3.id, viewer_id: user2.id })