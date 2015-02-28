
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

void setup() {
  size(640, 360);
  noStroke();
  smooth();

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {
  background(94, 245, 173);
  fill(255);
  rect(rx, ry, rd, rd);
  fill(255);
  ellipse(ex, ey, ed, ed);

  //rect
  if (mousePressed == true)
  {
    fill(31, 197, 255);  
    rect(rx, ry, rd, rd);
  }
    else if((mouseX >= width/2) && (mouseX<=width))
    {
      fill(200, 255, 39);
      ellipse(ex, ey, ed, ed);
  }
  else {
    float mx = map(mouseX, 0, width, 0, 40);
    fill(mx);
    ellipse(ex, ey, mx, mx);
    
}
}

