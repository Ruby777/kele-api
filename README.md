# Kele-API

## Description:
* A Ruby Gem API client to access the Bloc API.


## Summary:
* Bloc's API provides an external facing JSON Web Token authorized gateway to the Bloc application. 
* Users can access it via cURL, but an API client can manage the low-level details of making requests and handling responses.

## User Stories:
* As a user, I want to initialize and authorize Kele with a Bloc username and password

      kele_client = Kele.new(johndoe@gmail.com, password)
      
* As a user, I want to retrieve the current user as a JSON blob

      kele_client.get_me
      
* As a user, I want to retrieve a list of my mentor's availability

      kele_client.get_mentor_availability(mentor_id)

* As a user, I want to retrieve roadmaps and checkpoints

      kele_client.get_roadmap(chain_id)
     
      kele_client.get_checkpoints(checkpoint_id)

* As a user, I want to retrieve a list of my messages, respond to an existing message, and create a new message thread

      kele_client.get_messages(page_id = 1)
      
      kele_client.create_message(sender, recipient_id, subject, stripped_text)
      
* As a user, I want to retrieve a list of checkpoints remaining in my current section

      kele_client.get_remaining_checkpoints(chain_id)
