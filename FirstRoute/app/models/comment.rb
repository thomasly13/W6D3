# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text             not null
#  author_id  :bigint           not null
#  artwork_id :bigint           not null
#
class Comment < ApplicationRecord

    belongs_to :author,
    class_name: :User

    belongs_to :artwork,
    class_name: :Artwork
    
end
