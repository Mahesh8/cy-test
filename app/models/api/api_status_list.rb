module Api
  module ApiStatusList 
    OK = { 'status' => 'OK', 'message' => 'success'}
    UNKNOWN_ERROR = { 'status' => 'UNKNOWN_ERROR', 'message' => 'An error occurred. Please retry.'}
    INVALID_REQUEST = { 'status' => 'INVALID_REQUEST', 'message' => 'The request you sent is invalid'}
    INVALID_API_KEY = { 'status' => 'INVALID_API_KEY', 'message' => 'Your API key is invalid.'}
   end
end 
