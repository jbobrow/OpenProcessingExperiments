
class Artist {
  
  //instance variables
  String genre;
  String soloBand;
  String instruments;
  String popularity;
  
  //"outbound" relations
  Ticket[] tickets;
  Autograph[] autographs;
  T_Shirt[] t_Shirts;
  Photo[] photos;
  Venue[] venues;
  
  //constructor
  Artist(String genre_, String soloBand_, String instruments_, String popularity_, Ticket[] tickets_, Autograph[] autographs_, T_Shirt[] t_Shirts_, Photo[] photos_, Venue[] venues_) {
    genre = genre_;
    soloBand = soloBand_;
    instruments = instruments_;
    popularity = popularity_;
    tickets = tickets_;
    autographs = autographs_;
    t_Shirts = t_Shirts_;
    photos = photos_;
    venues = venues_;
  }
}

