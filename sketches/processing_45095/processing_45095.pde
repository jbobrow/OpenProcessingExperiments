
/*
  \class City
  \brief Represents a city. Has an id, location and distnaces vector
*/
class City {
  int id;
  PVector location;
  float[] distances;
  
  City(int id, float xpos, float ypos) {
    this.id = id;
    location = new PVector(xpos,ypos);
  }
  
  /// Draw the city
  void draw(){
    if (id == IDORG)
      fill(orgColor);
    else
      fill(otherColor);
    ellipse(location.x, location.y, cityDiam, cityDiam);
  }
  
  /// Calc distances to other cities and fill distances vector
  void calcDistances(City[] cities, int numCities) {
    distances = new float[numCities];
    for (int i = 0; i < numCities; ++i) {
      float d = PVector.dist(this.location, cities[i].location);
      distances[i] = d;
    }
  }
}


