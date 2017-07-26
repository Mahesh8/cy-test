CyTest::Application.routes.draw do
  namespace :api do
	namespace :v0 do
		match 'create_url' 	=> 'shorten_url#create_url', via: [:put, :post]
	end
  end
end