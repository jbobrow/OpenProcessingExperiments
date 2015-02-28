
// Pressing Control-R will render this sketch.
  
  
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
  
int x = 255;
int y = 0;

float r = random(0, 255);

void setup() {
  size(640, 360);
  smooth();
//  ellipseMode(RADIUS);
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {
  background(102);
  float d = dist(mouseX, mouseY, ex, ey);
    if (d < ed/2) {
      x += 3;
      fill(0, 0, 0, x);
    } else {
      x--;
      fill(0, 0, 0, x);
    }
    ellipse(ex, ey, ed, ed);

    if ((mouseX > rx) && (mouseX < rx + rd) &&
        (mouseY > ry) && (mouseY < ry + rd)) {
      y -= 3;
      fill(0, 0, 0, y);
    } else {
      y ++;
      fill(0, 0, 0, y);
    }
    rect(rx, ry, rd, rd);
}

