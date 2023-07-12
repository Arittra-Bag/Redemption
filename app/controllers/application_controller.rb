class SpotifyController < ApplicationController
    def index
      # Code for making API requests to Spotify and processing the data
      artist = RSpotify::Artist.search('Artist Name').first
      # Process the artist data or perform further actions
      @processed_data = process_artist_data(artist)
    end
  
    private
  
    def process_artist_data(artist)
      # Perform processing on the artist data
      # Example: Extract specific attributes or manipulate the data
      processed_data = {
        id: artist.id,
        name: artist.name,
        popularity: artist.popularity
      }
      processed_data
    end
  end
  