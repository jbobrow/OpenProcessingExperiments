
// generalize the drawing method for wiggle line
// create a demo result like grasses
// program for lectures on "The Wrong Way to Draw a Line"
// schien@mail.ncku.edu.tw

int div = 3;

void setup() {
  size(500, 500);
  noLoop();
}

void draw() {
  background(255);
  //wiggle_line(20, 50, 480, 350);
  //wiggle_line(20, 400, 400, 20);
  //wiggle_line(250, 10, 250, 490);
  //wiggle_line(100, 10, 100, 490);
  //wiggle_line(350, 10, 350, 490);
  
  // use for loop to draw many wiggle lines
  for (int i = 10; i<490; i+=10) {
    wiggle_line(i, 10, i, 450);
  }
}

void wiggle_line(float sx, float sy, float ex, float ey) {
  // try to draw the correct line first for reference
  strokeWeight(5);
  stroke(0, 30);
  line(sx, sy, ex, ey);

  // try to divide the line into some fixed baby lines
  float xstep = (ex - sx)/div;
  float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  for (int i=0; i<div; i++) {
    x = x + xstep;
    x = x + random(20) - 10; // wiggle on x
    y = y + ystep;
    y = y + random(50) - 25; // wiggle on y
    stroke(20, 50, 70);
    //line (x, y, lastx, lasty);
    line (x, height-y, lastx, height-lasty);
    lastx = x;
    lasty = y;
  }
}



