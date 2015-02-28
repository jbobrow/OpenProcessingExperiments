
Robot[] robot;
int numRobot = 70;

void setup() {
  size (500, 500);
  robot = new Robot[ numRobot ];
  for (int i = 0; i< numRobot; i++) {
    robot[i] = new Robot (random(width), random(height), random (30, 60) );
  }
}

void draw() {
  background( 255 );
  for ( int i=0; i<numRobot; i++ ) {
    //if ( i==0 ) {
      //fill( 255, 0, 0 );
    //}
    //else {
      //fill( 255 );
    //}
    //rotate(PI/4);
    robot[i].update();
    robot[i].render();
  }
}

class Robot {
  float x;
  float y;
  float vx;
  float vy;
  float r;

  //location
  Robot(float _x, float _y, float _r) {
    x = _x;
    y = _y;
    vx = random (5);
    vy = random (5);
    r = _r;
  }

  //movement
  void update() {
    x += vx;
    y += vy;
    vy += 0.1;

    if ( x < 0 || x > width ) {
      vx *= -1;
      if ( x<0 ) x = 0;
      else if ( x>width ) x = width;
    }
    if ( y < 0 || y > height ) {
      vy *= -1;
      if ( y<0 ) y = 0;
      else if ( y>height ) y = height;
    }
  }

  //how it looks
  void render() {
    pushMatrix();
    translate (x, y);
    rotate (PI/r);
    stroke(0);
    fill (233, 205, 76);
    ellipse (x, y, r, r);
    //eyes
    stroke (24, 3, 2);
    ellipse (x - r/4, y-r/4, r/10, r/10);
    ellipse (x + r/4, y-r/4, r/10, r/10);
    //mouse
    rectMode (CENTER);
    rect (x, y + r/4, r/2, r/4);
    popMatrix();
  }
}



