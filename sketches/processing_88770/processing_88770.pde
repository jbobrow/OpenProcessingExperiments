
float rx, ry; //rectangle x and y coordinates
float rd = 100; // rectangle width
float rh = 60; // rectangle height

float ex, ey; // ellipse x and y coordinates
float er = 60; //ellipse radius

float distance;
int rad;
int radius;


void setup() {
  size(640, 360);
  smooth();
  noStroke();
  ellipseMode (RADIUS);

  // Set the x and y coordinate for the rectangle
  rx = width *0.33 - rd/2;
  ry = height *0.5 - rd/2;

  //set the x and y coordinate for the ellipse
  ex = width *0.7; 
  ey= height *0.45;
  rad=60;
}

void draw  () {
  background(102);
  //  fill (240, 100, 60);
  //  rect (rx, ry, rd, rh);
  //
  //
  //  fill (240, 100, 60);
  //  ellipse (ex, ey, er, er);

  // rectangle
  if ((mouseX > rx) && (mouseX< rx+rd) && (mouseY > ry) && (mouseY< ry+rh)) {

    fill (255);
    rect (rx-15, ry-15, rd+30, rh+30);
  }//if
  else {
    fill (240, 100, 60);
    rect (rx, ry, rd, rh);
  }



  //ellipse

  distance = dist (mouseX, mouseY, ex, ey);
  if (distance<=rad) {

    fill (255);     
    ellipse (ex, ey, er*1.2, er*1.2);
  }

  else {
    fill (240, 100, 60);
    ellipse (ex, ey, er, er);
  }
}



