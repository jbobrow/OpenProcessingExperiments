
class City {
  
  // instance variables
  String location;
  int population;
  float longitude;
  float latitude;
  
  // "outbound" relations
  Team [] teams;

  // constructor
  City(  String location_, int population_, float longitude_, float latitude_,Team [] teams_) {
    location = location_;
    population = population_;
    longitude = longitude_;
    latitude = latitude_;
    teams = teams_;
  }
}

