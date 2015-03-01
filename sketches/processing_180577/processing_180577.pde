

int WSIZE = 500;
float c = WSIZE/2;
float RADIUS = 3;

int NPOINTS = 4;

/* Points array */
Point[] parray = new Point[] {new Point(0 + c, 0 + c, c, 2, 1),
                              new Point(0 + c, 0 + c, c, 1, 2), 
                              new Point(0 + c, 0 + c, c, 2, 1), 
                              new Point(0 + c, 0 + c, c, 1, 2)} ;

/* Colors array */
int[] red = { 50, 100, 150, 200 };
int[] gre = { 50, 100, 150, 200 };
int[] blu = { 50, 100, 150, 200 };


void setup() {
  frameRate(100);
  size(500, 500);
  background(0);
}

void draw() {
  for ( int n = 0; n < NPOINTS; n++ ) {
    noStroke();
    fill( red[n], gre[n], blu[n] );
    ellipse( parray[n].getX(), parray[n].getY(), RADIUS, RADIUS);
    parray[n].updatePoint();
  }
}
class Point {
  float x;
  float y;
  float z;
  float step_right, step_left;

  Point(float x0, float y0, float z0, float sright, float sleft) {
    x = x0;
    y = y0;
    z = z0;
    step_right = sright;
    step_left = sleft;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
  
  float getZ() {
    return z;
  }

  void updatePoint() {
    if ( x > WSIZE || x < 0 || y > WSIZE || y < 0 || z > WSIZE || z < 0) {
      x = random(0, WSIZE);
      y = random(0, WSIZE);
      z = random(0, WSIZE);
    } else {
      x = updateCoordinate(x);
      y = updateCoordinate(y);
      z = updateCoordinate(z);
    }
  }
  
  float updateCoordinate(float t) {
      if (random(0, 1) > 0.5) {
        return t + step_right;
      } else {
        return t - step_left;
      }
  }
}


