
//this class is for the bad antibiotic balls. If the worm collides with a ball,
//the game automaticaly ends.
class Ball {
  float x, y;   // current position
  float vx, vy;  // velocity
  float vr; //ball radius multiplier (increases over time)
  float r;   //radius
  float vMin;
  float vMax;
  color c; //ball color
  float spring = 0.2; //ball springiness (for collisions)
  boolean on = false;


  Ball() {
  }

  // Initialize ball offscreen (right of canvas)
  void initialize()
  {
    on = true;
    vMin = -5;
    vMax = -2;
    x = random(width+200, width+600); 
    y = random(0, height);
    vx = random(vMin, vMax); 
    vy = random(-2, 2);
    vr = 1;
    r = vr * random(10, 30);
    c = color(random(100, 255), 0, random(0, 100));
  }

  void draw()
  {
    if (!on) return;
    noStroke(); 
    fill(c, 200);
    ellipse(x, y, 2*r, 2*r);
  }

  void update()
  {
    // initialize if necessary
    if (!on) { 
      if (random(0, 1) < 0.5) initialize(); 
      return;
    }

    //move ball
    x += vx;
    y += vy;

    //reverse ball vy when it hits floor/ceiling
    if (y > height-r || y < r)
    {
      vy = -vy;
    }

    // When ball exits screen, re-initialize
    if (x < 0) {
      on = false;
    }

    vMin += -0.1;
  }

  //check for collisions with other balls
  void bounce() {
    for (int i = 0; i < nBalls; i ++) {
      // if this is myself, continue
      if (this == balls[i]) continue;
      // distance between two balls
      float d = dist(x, y, balls[i].x, balls[i].y);
      // minimum distance between two balls
      float md = r+balls[i].r;
      // if I collide with one of them
      if (d < md && balls[i].x < width) {
        // push back in the opposite direction
        float dx = (x - balls[i].x)/d;
        float dy = (y - balls[i].y)/d;
        // check if perfectly overlapping
        if (dx == 0 && dy == 0) { 
          dx = random(-1, 1); 
          dy = random(-1, 1);
        }
        // compute the speed to add
        float s = min(10, spring*(md-d));
        vx += dx*s;
        vy += dy*s;
      }
    }
  }
}


