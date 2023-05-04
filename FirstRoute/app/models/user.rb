# == Schema Information
#
# Table name: users
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks, 
    foreign_key: :artist_id, 
    inverse_of: :artist,
    dependent: :destroy

    has_many :artwork_viewed,
    foreign_key: :viewer_id,
    inverse_of: :viewer

    has_many :shared_artworks,
    through: :artwork_viewed,
    source: :artwork

    has_many :comments,
    foreign_key: :author_id,
    inverse_of: :author,
    dependent: :destroy

end
