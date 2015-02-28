
/** lots of dots by Christian Vengels
 * effect that was not expected to happen.
 * if you click a mouse button you can see what it was meant to be :P
 */

int dimension=40;
int offset=2;
float distance=300, targetDistance;
float easing=0.05;

void setup() {
  size (400, 400, P3D);
  colorMode(RGB, dimension);
}

void draw() {
  background(0);
  strokeWeight(2);
  translate(width/2, height/2, distance);
  rotateX(millis()*0.0002);
  rotateY(millis()*0.0004);
  ease();
  drawFoo();
}

void ease() {
  if (mousePressed == true) {
    targetDistance=100;
  } 
  else {
    targetDistance=300;
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
        stroke(x, y, z);
        point(x*offset, y*offset, z*offset);
      }
    }
  }
}


