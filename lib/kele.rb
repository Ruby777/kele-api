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

    def get_me
        response = self.class.get('https://www.bloc.io/api/v1/users/me', headers:{ "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def get_mentor_availability(mentor_id)
        response = self.class.get('https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability', headers:{ "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def get_roadmap(chain_id)
        response = self.class.get('https://www.bloc.io/api/v1/roadmaps/#{chain_id}', headers:{ "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def get_checkpoint(checkpoint_id)
        response = self.class.get('https://www.bloc.io/api/v1/checkpoints/#{checkpoint_id}', headers:{ "authorization" => @auth_token })
        JSON.parse(response.body)
    end
end