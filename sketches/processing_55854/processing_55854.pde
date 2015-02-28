

/*
Function returns an MMTrack object.
*/
MMTrack getLyrics(String trackName_, String artistName_) {
  
  // Track Search [ Fuzzy ]
  try {
    
    // first, search for track and get the corresponding album id
    Track track = musixMatch.getMatchingTrack(trackName_, artistName_);

    TrackData data = track.getTrack();
    
    // get track ID    
    int trackID = data.getTrackId();
        
    // now, get lyrics for the specified track ID
    Lyrics lyrics = musixMatch.getLyrics(trackID);
    
    int trackId =  data.getTrackId();
    int albumId =  data.getAlbumId();
    String albumName =  data.getAlbumName();
    String artistId =  data.getArtistId();
    String artistName =  data.getArtistName();
    String trackLyrics =  lyrics.getLyricsBody();
    String trackName = data.getTrackName();
  
    // print album and lyrics data to console
    println("Track ID : "   + trackId);
    println("AlbumID : "    + albumId);
    println("Album Name : " + albumName);
    println("Artist ID : "  + artistId);
    println("Artist Name : " + artistName);
    println("Lyrics Body : " + trackLyrics);
    println("Track Name :" + trackName);
   
    
    // create a new track object to store data in
    // MMTrack(String id_, String albumId_, String albumName_, String artistId_, String artistName_, String lyrics_) {
    MMTrack trackObject = new MMTrack(trackId, albumId, albumName, artistId, artistName, trackLyrics, trackName);
    
    return trackObject;
    
  } catch (Exception e) {
    println("Error"); 
  }
  
  return null;
}

