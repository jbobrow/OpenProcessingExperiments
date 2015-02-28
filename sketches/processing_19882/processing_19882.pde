
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 9-9: An array of Car objects
PImage myBug;

// The Car class does not change whether we are making one car, 100 cars or 1,000 cars!
class Roach {
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;

  Roach(float xpos_, float ypos_, float xspeed_, float yspeed_) {
    xpos = xpos_;
    ypos = ypos_;
    xspeed = random(.1,1);
    yspeed = yspeed_;
  }

  void display() {
    image (myBug,xpos,ypos);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width + 135) {
      xpos = 0;
    }
  }
  
  void scatter() {
    xpos = xpos - random(5,7);
    if (xpos < -135) {
      xpos = -135;
    }
  }
}

