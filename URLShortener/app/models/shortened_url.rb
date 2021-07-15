# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'securerandom'
class ShortenedUrl < ApplicationRecord

    validates :long_url, :user_id, presence:true
    validates :short_url, presence:false


    def self.random_code
        tiny = SecureRandom::urlsafe_base64
        # ShortenedUrl.exists?(short_url: tiny)
        while ShortenedUrl.exists?(short_url: tiny)
            tiny = SecureRandom::urlsafe_base64
        end
        "www.short.com/#{tiny}" #or not in the database
    end

    def self.create!(userobj, long_url_str)
        filled = ShortenedUrl.new(long_url: long_url_str, short_url: ShortenedUrl.random_code, user_id: userobj.id)
        filled.save
    end
end
