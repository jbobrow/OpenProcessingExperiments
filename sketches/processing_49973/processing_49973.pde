
class Album {
  
  // instance variables
  String title;
  String band;
  String label;
  int yearReleased;
  
  // "outbound" relations
  ArtWork[] artWork;
  
  // constructor
  Album(String title_, String band_, String label_, int yearReleased_, ArtWork[] artWork_) {
    title = title_; // ! you needed to use your variable "title"; you had "name" which wasn't declared
    band = band_;
    label = label_;
    yearReleased = yearReleased_;
    artWork = artWork_;
  }
}

