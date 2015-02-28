
/** lots of dots by Christian Vengels
 * effect that was not expected to happen.
 * if you click a mouse button you can see what it was meant to be :P
 
 edited by cChristopher Heard. */

int dimension=30;
int offset=5;
int lines=50;
float distance=300, targetDistance;
float easing=0.01;

void setup() {
  size (400, 400, P3D);
  colorMode(RGB, dimension);
}

void draw() {
  background(0);
  strokeWeight(2);
  translate(width/2, height/2, distance);
  rotateX(millis()*0.0001);
  rotateY(millis()*0.0001);
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

//void spherez() {
//  float xoff = 0.0;
//{
//  {background(204);}
//  {xoff = xoff + .1;
//  float n = noise(xoff) * width;
//  translate(n,0,0);
//  sphere(25);}
//}
//}
//void randomlines() {
// // translate(-dimension/2*offset, -dimension/2*offset, -dimension/2*offset);
//for(int i=0; i < lines; i++) {
//  float a = random(0, dimension);
//  float b = random(0, dimension);
//  float c = random(0, dimension);
//  float da = random(a-15, a+15);
//  float db = random(b-15, b+15);
//  float dc = random(c-15, c+15);
//  stroke(150);
//  line(a, b, c, da, db, dc);
//}
//}

