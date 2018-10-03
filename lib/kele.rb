require "httparty"
require "json"

class Kele
    include HTTParty
    
    def initialize(email, password)
        @options = {query: {email: email, password: password}}
        response = self.class.post('https://www.bloc.io/api/v1/sessions', @options)
        @auth_token = response["auth_token"]
        raise "Wrong email or password" if response.code != 200
    end
end