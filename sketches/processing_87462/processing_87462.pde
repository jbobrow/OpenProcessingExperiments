
// Boundaries : Square & Circle


//  Variables
float rx, ry; //rectangle x and y coordinates
float rd = 100; // rectangle width
float rh = 70; // rectangle height

float ex, ey; // ellipse x and y coordinates
float ed = 50; //ellipse radius

float distance;
int rad;
int radius;

//setup
void setup () {
  size (640, 360);
  smooth ();
  noStroke ();
  background (185, 240, 233);
  ellipseMode (RADIUS);

  // Set the x and y coordinate for the rectangle
  rx = width *0.33 - rd/2;
  ry = height *0.54 - rd/2;

  //set the x and y coordinate for the ellipse
  ex = width *0.66; //422.4
  ey= height *0.5; //180
  rad= 50;
}

void draw  () {
  fill (255);
  rect (rx, ry, rd, rh);
  fill (241, 159, 61);
  ellipse (ex, ey, ed, ed);

  // rectangle
  if ((mouseX >= rx) && (mouseX< rx+rd) && (mouseY >= ry) && (mouseY<= ry+rh)) {
    if (mousePressed ==true) {
      fill (255, 0, 0);
      rect (rx, ry, rd, rh);
    }
    else {
      fill (61, 87, 241);
      rect (rx, ry, rd, rh);
    }
  }

  //ellipse

  distance = dist (mouseX, mouseY, ex, ey);
  if (distance<=rad) {
    if (mousePressed ==true) {
      fill (208, 238, 69);      
      ellipse (ex, ey, ed, ed);
    }
    else {
      fill (255);
          ellipse (ex, ey, ed, ed);

    }
  }
}

/*
  if ((mouseX >= ex-ed) && (mouseX < ex+ed) && (mouseY >= ey-ed) && (mouseY < ey+ed)) {//&& (mouseX< ex+ed) && (mouseY >= ey) && (mouseY<= ey+ed)) {
 if (mousePressed ==true) {
 fill (208, 238, 69);      
 ellipse (ex, ey, ed, ed);
 }
 else {
 fill (255);
 }
 ellipse (ex, ey, ed, ed);
 }
 }
 */


