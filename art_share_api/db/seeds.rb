# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
users = User.create!([{username: 'Dan123'},{username: 'Lukesky'},{username: 'Starnerd'},{username: 'Jimmyjohn'}])

artworks = Artwork.create!([{title: "A", image_url: "a.com", artist_id: users[0].id},
                            {title: 'B', image_url: 'b.com', artist_id: users[1].id},
                            {title: 'C', image_url: 'c.com', artist_id: users[2].id},
                            {title: 'D', image_url: 'd.com', artist_id: users[3].id}])


artworkshares = ArtworkShare.create!([{viewer_id:users[0].id,artwork_id:artworks[0].id},
{viewer_id:users[2].id,artwork_id:artworks[3].id}
])