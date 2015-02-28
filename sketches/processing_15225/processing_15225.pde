
// A simple class to store a (lat, lon) coordinate
// Not that there are no methods... they are not required always 
class Coordinate {
  float lat;
  float lon;

  Coordinate(float _lat, float _lon) {
    lat = _lat;
    lon = _lon;
  }
} // <---- NOTE: the class ends here!

// What follows is two "utility functions" to help us project coordinates 

Coordinate getAlbersProjection(Coordinate input) {
  // see http://mathworld.wolfram.com/AlbersEqual-AreaConicProjection.html
  // for details
  float phi0 = 0;
  float lambda0 = radians(-96);
  float phi1 = radians(29.5f);
  float phi2 = radians(45.5f);

  float phi = radians(input.lat);
  float lambda = radians(input.lon);

  float n = 0.5f * (sin(phi1) + sin(phi2));
  float theta = n* (lambda - lambda0);
  float c = sq(cos(phi1)) + 2*n*sin(phi1);
  float rho = sqrt(c - 2*n*sin(phi)) / n;
  float rho0 = sqrt(c - 2*n*sin(phi0)) / n;

  float newLon = rho * sin(theta);
  float newLat = rho0 - rho * cos(theta);

  return new Coordinate(newLat, newLon);
} 


Coordinate getMercatorProjection(Coordinate input) {
  float newLon = input.lon * PI/180;
  float newLat = log(tan(PI/4 + input.lat * PI/360));
  return new Coordinate(newLat, newLon);
}

 


