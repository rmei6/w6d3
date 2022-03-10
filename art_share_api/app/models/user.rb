# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           default(""), not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy

    has_many :artworkshares,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks,  #maybe wrong?
        through: :artworkshares,
        source: :artwork

    has_many :comments,
        foreign_key: :user_id,
        class_name: :Comment,
        dependent: :destroy
    
    has_many :likes,
        foreign_key: :user_id,
        class_name: :Like

    has_many :liked_artworks,
        through: :likes,
        source: :liked,
        :source_type => "Artwork"

    has_many :liked_comments,
        through: :likes,
        source: :liked,
        :source_type => "Comment"
end 
