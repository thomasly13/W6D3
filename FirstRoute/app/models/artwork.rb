# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :text             not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, :artist, presence: true
    validates :artist_id, uniqueness: {scope: :title}

    belongs_to :artist, class_name: :User

    has_many :artwork_shares,
    foreign_key: :artwork_id,
    inverse_of: :artwork,
    dependent: :destroy

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

    has_many :comments,
    foreign_key: :artwork_id,
    inverse_of: :artwork,
    dependent: :destroy

    def self.artworks_for_user_id(user_id)
        self
        .select(:title)
        .joins(:shared_viewers)
        .where('artwork_shares.viewer_id = ?', user_id)
        .where('artist_id = ?', user_id)
    end
end
