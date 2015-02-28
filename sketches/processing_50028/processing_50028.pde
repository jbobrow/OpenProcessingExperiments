
float rx, ry;    // rectangle x- and y-coordinate in the center of square
float rx2, ry2;  
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
float er = 53;   // ellipse radius

void setup() {
  size(640, 360);
  smooth();
  stroke(0.5);
  ellipseMode(RADIUS);
  rectMode(CENTER);

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33;
  ry = height * 0.5;

  // rectangle x and y coordinate at top left corner of square
  rx2 = rx - 50; 
  ry2 = ry - 50; 

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {
  background(255, 253, 229);
  cursor(ARROW);
  fill(139, 76, 203);
  rect(rx, ry, rd, rd);
  fill(64, 167, 255);
  ellipse(ex, ey, er, er);

  // Makes rectangle blue when rolled over
  if ((mouseX > rx2) && (mouseX < (rx2+rd)) && (mouseY > ry2) && (mouseY < (ry2+rd)))
  {
    fill(64, 167, 255);
    rect(rx, ry, rd, rd);
    if (mousePressed == true)
    {
      cursor(CROSS);
      if (mouseButton == LEFT)
        // Left click for radiating squares 
      {
        for (float i = 100; i < 900; i *= 1.15)
        {
          stroke(0);
          noFill();
          rect(rx, ry, i, i);
        }
      }
      else if (mouseButton == RIGHT)
        // Right click for radiating circles
      {
        for (float i = 33; i < 900; i *= 1.15)
        {
          fill(64, 167, 255);
          rect(rx, ry, rd, rd);
          stroke(0);
          noFill();
          ellipse(rx, ry, i, i);
        }
      }
    }
  }

  // Makes circle purple when rolled over
  float d = dist(mouseX, mouseY, ex, ey);
  if (d < er)
  {
    fill(139, 76, 203);
    ellipse(ex, ey, er, er);
    if (mousePressed == true)
    {
      cursor(CROSS);
      if (mouseButton == LEFT)
        // Left click for radiating circles 
      {
        for (float i = 53; i < 900; i *= 1.15)
        {
          stroke(0);
          noFill();
          ellipse(ex, ey, i, i);
        }
      }
      else if (mouseButton == RIGHT)
        // Right click for radiating squares
      {
        for (float i = 50; i < 900; i *= 1.15)
        {
          fill(139, 76, 203);
          ellipse(ex, ey, er, er);
          stroke(0);
          noFill();
          rect(ex, ey, i, i);
        }
      }
    }
  }
}


