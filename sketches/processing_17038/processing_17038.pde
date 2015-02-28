
class Algae {
  int r,x,y;
  float c2;
  float xoff = random(1000);
  int time=0;
  boolean thisIsOn = false;

  // Constructor
  Algae(int tempR, int tempX, int tempY) {
    r = tempR;
    x = tempX;
    y = tempY;
  }

  void display() {
    noStroke(); 
    fill(0,0,c2);
    ellipse(x,y,r,r);
  }

  void glow(int p) {
    c2 = p;
  }

 /*
  void glowIn() {
    xoff += .01;
    c2 += noise(xoff);
  }*/

  void glowOut() {
    xoff += .01;
    c2 -= noise(xoff);
    //c2 -= 1;
  }

}


