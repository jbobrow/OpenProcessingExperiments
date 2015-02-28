
class Haz {
 
  int numrays; // number of rays
  Ray[] r; // array to hold all the rays
  Ray rocket; // an initial vertical ray to represent the rocket
  float rocketspeed;
  float flighttime;
  float maxrheight;
  float xIniHaz, yIniHaz; // center point of star
  float rocketxspeed;
  float rocketyspeed;
 
  void start (float xIniHazCon ,float yIniHazCon, int numraysCon) {
    xIniHaz=xIniHazCon;
    yIniHaz=yIniHazCon;
    numrays=numraysCon;
    
    // create the ray for the rocket
    rocketxspeed = random(-1,1);
    rocketyspeed = random(-4,-2);
    flighttime = rocketyspeed/0.05;
    maxrheight = rocketyspeed*flighttime/2;
    rocket = new Ray(xIniHaz, yIniHaz, rocketxspeed, rocketyspeed, 2, 500);
    
    // create all the rays and store them in the array r
    r= new Ray[numrays];
    for (int i=0; i<numrays; i++) {
      r[i] = new Ray(xIniHaz - rocketxspeed*flighttime, yIniHaz - maxrheight, random (-2, 2), random(-2.5, 0.5), 1, 60); 
    }
  }
 
  void update () {
    if (rocket.speedY < 0) { // we are in the rocket stage
      rocket.update();
    } else { // we are in the explosion stage
    // move and display all the rays
      for (int i=0; i<numrays; i++) {
        r[i].update();
      }
    }
  } 
}

