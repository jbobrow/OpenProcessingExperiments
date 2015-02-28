
class Cir { //classname
  float xpos;
  float ypos;
  float xspeed;
  float c;

  Cir(float tempx, float tempy, float tempspeed, color tempC) {
    println("a cir has been created");

    xpos = tempx;
    ypos = tempy;
    xspeed = tempspeed;
    c = tempC;
  }
  void display() {
    stroke(0) ;
    fill(random(250), 235, 0);
    ellipseMode (CENTER);
    ellipse (xpos, random(ypos), 4, 4);
  }
  void fly () {
    xpos = xpos+xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
  void flyslow() {            
    xpos = xpos - 10*xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }

}


