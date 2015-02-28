
class albums {
   
  // instance variables
  String title;
  String year;
  String artwork;
  String cover;
  String genre;
  String collaborations;

   
  // "outbound" relations
  producer[] Producer;
  genres[] Genres;
  artist[] Artist;
   
  // constructor
   albums (String title_, String year_, String artwork_,String cover_, String genre_, String collaborations_, albums[] Albums_) {
    title = title_;
    year = year_;
    artwork = artwork_;
    cover = cover_;
    genre = genre_;
    collaborations = collaborations_;
  }
}

