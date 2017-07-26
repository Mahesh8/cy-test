class Url < ApplicationRecord
	validates :url, presence: true, on: :create
  	validates_format_of :url,
    with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/

 	before_create :generate_short_url


    def generate_short_url
	    chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
	    self.short_url = 6.times.map{chars.sample}.join
	    self.short_url = 6.times.map{chars.sample}.join until Url.find_by_short_url(self.short_url).nil?
    end

    #clean url by removing www and https or / at the end. This ensures any url entered indifferent form will be stored in on way
    def sanitize
	    self.url.strip!
	    self.clean_up_url = self.url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
	    self.clean_up_url.slice!(-1) if self.clean_up_url[-1] == "/"
	    self.clean_up_url = "http://#{self.clean_up_url}"
  	end

end
