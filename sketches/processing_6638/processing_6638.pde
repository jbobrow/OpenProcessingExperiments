
class Haz {

  int numrays;
  Ray[] r;
  float xIniHaz,yIniHaz;
  int tono;

  void start (float xIniHazCon ,float yIniHazCon, int numraysCon, int tonoCon) {
    xIniHaz=xIniHazCon;
    yIniHaz=yIniHazCon;
    numrays=numraysCon;
    tono = tonoCon;
    r= new Ray[numrays];
    for (int i=0; i<numrays; i++) {
      r[i] = new Ray(xIniHaz, yIniHaz, random (-2,2), random(-2,2), tono ); 
    }
  }

  void update () {
    for (int i=0; i<numrays; i++) {
      r[i].move();
      r[i].display();
    }
  } 
}







