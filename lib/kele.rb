require "httparty"

class Kele
    include HTTParty
    

    def initialize(username, password)
        @base_url = 'https://www.bloc.io/api/v1'
        response = self.class.post(
             'https://blocapi.docs.apiary.io/#reference/0/sessions', 
             email: username, 
             password: password
            )
        @auth_token = response["auth_token"]
        raise "Wrong email or password" if response.code != 200
    end
end