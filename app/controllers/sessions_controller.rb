class SessionsController < ApplicationController
    def create
      spotify_user = RSpotify::User.new_from_auth_hash(auth_hash)
      # Save relevant user information or create/update a user record in your database
      # Set session variables or implement a user authentication mechanism
      # Redirect to a desired page after successful authentication

      auth_info = auth_hash['credentials']
      access_token = auth_info['token']
      # Use the access token as needed

      # Use the access token to authenticate API requests
      RSpotify::authenticate('7ae68f0d89384801b54161ebf415013e', 'c8955c3dbc994e25bb7e6050900c72cb')
      RSpotify::authenticate(access_token)

      # Retrieve the user's playlists
      playlists = spotify_user.playlists

      # Process the playlists or pass them to the view for rendering
      # For example, you can store the playlists in an instance variable to use in the view:
      #@playlists = playlists
      processed_playlists = process_playlists(playlists)

      # Store the processed playlists in the database
      processed_playlists.each do |playlist|
          ProcessedPlaylist.create(name: playlist.name, description: playlist.description)

      # Redirect to a desired page or render a view
    end
  
    def failure
      # Handle authentication failure
      # Redirect to an error page or take appropriate action
    end
  
    def destroy
      # Implement logout functionality
      # Clear session variables or invalidate user authentication
      # Redirect to the desired page after logout
    end
  
    private
  
    def auth_hash
      request.env['omniauth.auth']
    end

    def process_playlists(playlists)
        processed_playlists = []
    
        playlists.each do |playlist|
          # Apply any necessary processing operations to the playlist
          # For example, filter out unwanted playlists or sort them based on criteria
    
          # Add the processed playlist to the array
          processed_playlists << playlist
        end
    
        return processed_playlists
      end
  end
