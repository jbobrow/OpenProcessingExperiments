
float rx, ry;    // rectangle x- and y-coordinate
float rd = 40;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 40;  // ellipse diameter
float radius = ed/2;

void setup() {
  size(640, 360);
  smooth();
  background(71, 70, 147);
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw()
{
  float d = dist(ex, ey, mouseX, mouseY);

  
  if ((mouseX >rx) && (mouseX <rx+rd) && (mouseY > ry) && (mouseY< ry+rd))
  {
    background(71, 70, 147);
    noStroke();
    rect(rx, ry, rd, rd);
    fill(255, 255, 116, 20);
    ellipse(ex, ey, ed, ed);
    ed++;
    
    if (mousePressed == true)
    {
      rd--;
    }
  }

  else if (d < radius)
  {
    background(71, 70, 147);
    fill(136, 232, 226, 20);
    rect(rx,ry,rd,rd);
    noStroke();
    ellipse(ex, ey, ed, ed);
    rd++;
    
    if (mousePressed == true)
    {
      background(71,70,147);
      ed--;
    }
  }

  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
}


