
class Orbit {
  //data

  float theta;
  int r;
  int r2;
  float t;

  //constructor

  Orbit (float tempTheta, int tempR, int tempR2, float tempT) {
    theta=tempTheta;
    r=tempR;
    r2= tempR2;
    t= tempT;
  }

  void move() {

    // orbiting circle


      ellipse (width/2 + cos(theta)*r2, height/2 + sin(theta)*r2, r, r);


    //increment theta
    //increase to speed up movement

    theta += .05;


    if (r<width-20) {
      r++;
    }
    else {
      r=r*-1;
    }
  }
}


