module Api
module V0
	class ShortenUrlController 
		def create_url
			response = Hash.new
			result = Hash.new
			url = Url.new(url: params[:url])
			url.sanitize
			if url.save
				result['url'] = Url.where(id: url.id).first.select([:url, :short_url]).as_json
				response['result'] = result
				response.merge! ApiStatusList::OK
			else
				response.merge! ApiStatusList::UNKNOWN_ERROR
			end
			render :json => response
		end
	end
end