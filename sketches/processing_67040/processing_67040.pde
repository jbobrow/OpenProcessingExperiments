
class Ring {
  int r, strokeW;     // Radius, stroke weight
  float x, y;          // current position  
  float homeX, homeY;  // intented position
  float spY, spX;      // movement speed      
  float gra = 0.05;    // gravity
  color c;            // color

  Ring (float x_, float y_, int r_, int g_, int b_) { // Constructor for Olympic rings
    homeX = x_;            // set the intented position
    homeY = y_;
    x = random(0, width);  // random a initial position
    y = random(0, height);
    r = 100;
    strokeW = 10;

    c = color(r_, g_, b_);
  }

  Ring () {                        // Constructor for small droping rings 
    homeX = x = random(0, width);  //set the position on top of screen with random X
    homeY = y = -10;
    r = 10;
    strokeW = 2;

    int r = int(random(0, 255));  // generate a random color
    int g = int(random(0, 255)); 
    int b = int(random(0, 255)); 
    c = color(r, g, b);
  }

  void reset() { // reset the position and movement speed
    x = homeX;
    y = homeY;
    spY = random(0, 2);
    spX = 0;
  }

  void shake() { // move left or right a bit to make a shaking effect
    x += random(-0.5, 0.5);
  }

  void freefall() { // the ring is moving at the current speed
    x += spX;
    y += spY;
    spY += gra;  // speed Y is accelerated by the gravity
  }

  void bounce() { // reverse speed Y and random a speed X when the ring is bouncing
    y -= spY;
    spY = spY * -0.9; 
    spX = random(-2, 2);
  }

  void drawRings() { // draw the ring on current position
    noFill();
    stroke(c);
    strokeWeight(strokeW);

    ellipse(x, y, r, r);
  }
}


