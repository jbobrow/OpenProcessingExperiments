
/** lots of dots 2 by Christian Vengels
 * effect that WAS EXPECTED to happen ;)
 * if you click a mouse button you can zoom into the cube
 */
 
// import processing.opengl.*;

int dimension=24;
int offset=10;
float distance=-200, targetDistance;
float easing=0.05;

void setup() {
  size (400, 400, P3D);
  colorMode(RGB, dimension);
}

void draw() {
  background(0);
  strokeWeight(10);
  translate(width/2, height/2, distance);
  rotateX(millis()*0.0004);
  rotateY(millis()*0.0007);
  ease();
  drawFoo();
}

void ease() {
  if (mousePressed == true) {
    targetDistance=200;
  } 
  else {
    targetDistance=-200;
  }
  float diffDistance = targetDistance - distance;
  if(abs(diffDistance) > 1) {
    distance += diffDistance * easing;
  }
}

void drawFoo() {
  translate(-dimension/2*offset, -dimension/2*offset, -dimension/2*offset);
  for (int x=0; x<dimension; x++) {
    for (int y=0; y<dimension; y++) {
      for (int z=0; z<dimension; z++) {
        //stroke(x, y, z);
        if (x <= 0 || x > dimension - 2 || x % 8 == 0 ||
            y <= 0 || y > dimension - 2 || y % 8 == 0 ||
            z <= 0 || z > dimension - 2 || z % 8 == 0) {
          stroke(x, y, z, 3);
          point(x*offset, y*offset, z*offset);
        }
      }
    }
  }
}



