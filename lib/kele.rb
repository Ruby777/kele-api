require "httparty"
require "json"
require_relative "./roadmap"

class Kele
    include HTTParty
    include Roadmap
    
    def initialize(email, password)
        @options = {query: {email: email, password: password}}
        response = self.class.post("https://www.bloc.io/api/v1/sessions", @options)
        @auth_token = response["auth_token"]
        raise "Wrong email or password" if response.code != 200
    end

    def get_me
        response = self.class.get("https://www.bloc.io/api/v1/users/me", headers:{ "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def get_mentor_availability(mentor_id)
        response = self.class.get("https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability", headers:{ "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def get_messages
        response = self.class.get("https://www.bloc.io/api/v1/message_threads", headers:{ "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def create_message(sender, recipient_id, subject, stripped_text)
        response = self.class.post("https://www.bloc.io/api/v1/messages",
        body: {
            "sender": sender,
            "recipient_id": recipient_id,
            "subject": subject,
            "stripped-text": stripped_text
              }, 
        headers: { "authorization" => @auth_token })
        raise "There was a problem sending the message. Please try again" if response.code != 200
    end
end