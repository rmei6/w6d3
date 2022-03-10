class Artwork < ApplicationRecord
  validates :image_url, presence: true, uniqueness: true
  validates :title, :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id,
    message: "one per artist"}


    belongs_to :artist,
      foreign_key: :artist_id,
      class_name: :User

    has_many :artworkshares,
      foreign_key: :artwork_id,
      class_name: :ArtworkShare

    has_many :shared_viewers,
      through: :artworkshares,
      source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

  def self.artworks_for_user_id(user_id)
    Artwork
      .left_outer_joins(:artworkshares)
      .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
      .distinct
  end

end 