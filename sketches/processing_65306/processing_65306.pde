
// Pressing Control-R will render this sketch.

float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

void setup()
  {
  size(640, 360);
  smooth();

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2; ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66; ey = height * 0.5;
  }

void draw()
  {
  background(132, 189, 228);
  strokeWeight(1);
  color(255);
      if ((mouseX>=rx)&&(mouseX<=rx+100)&&(mouseY>height * 0.5 - rd/2)&&(mouseY<height * 0.5 + rd/2)){background(196, 223, 155);}
      if ((mouseX<=ex+53)&&(mouseX>ex-53)&&(mouseY<=ey+53)&&(mouseY>ey-53)){background(207, 100, 158); strokeWeight(20);}
  rect(rx, ry, rd, rd); ellipse(ex, ey, ed, ed);
  }


