
class Album {
  
  // instance variables
  String title;
  String artist;
  int yearProduced;
  
  // "outbound" relations
  Artist[] artists;
  
  // constructor
  Album(String title_, String artist_, int yearProduced_, Artist[] artists_) {
    title = title_;
    artist = artist_;
    yearProduced = yearProduced_;
    artists = artists_;
  }
}

