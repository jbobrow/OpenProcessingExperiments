
class Orbit {
  //data (variables)
  float theta; //theta is angle
  int r; //radius of circle
  int r2; //radius of orbit
  int r3; //radius of orbit
  float t;
  //constructor
  Orbit (float tempTheta, int tempR, int tempR2, float tempT) {
    theta = tempTheta;
    r = tempR;
    r2 = tempR2;
    t = tempT;
  }


  //methods and functions
  void move () {
    stroke(250,0,0,10);
    ellipse (mouseX + cos(theta)*r2, mouseY + sin(theta)*r2, r, r);

    //increment theta
    //increase to speed up movement
    theta += t;
    //increment s to change radius of circle
  }
}


