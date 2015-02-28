
class BrochureMap {
  
  // instance variables
  String location;
  String features;
  
  // "outbound" relations
  Schedule[] schedules;
  VacationSpot[] vacationSpots;
  Photograph[] photographs;
  
  // constructor
  BrochureMap(String location_, String features_, Schedule[] schedules_, VacationSpot[] vacationSpots_, Photograph[] photographs_) {
    location = location_;
    features = features_;
    schedules = schedules_;
    vacationSpots = vacationSpots_;
    photographs = photographs_;
  }
}

