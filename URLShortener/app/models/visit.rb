# == Schema Information
#
# Table name: visits
#
#  id                 :bigint           not null, primary key
#  visitor            :integer          not null
#  visited_short_urls :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Visit < ApplicationRecord
    validates :visitor, :visited_short_urls, presence:true

    belongs_to :visitors,
        primary_key: :id,
        foreign_key: :visitor,
        class_name: :User 

    belongs_to :visited_urls,
        primary_key: :id,
        foreign_key: :visited_short_urls,
        class_name: :ShortenedUrl
end
