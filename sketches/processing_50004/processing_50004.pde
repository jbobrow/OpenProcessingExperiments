
//Pauline Woo
//01/24/12

float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
float radius = 53; // ellipse radius

void setup()
{
  size(640, 360);
  smooth();
  fill(255);

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() 
{
  stroke(80);
  strokeWeight(1);
  background(102);
  
  rect(rx, ry, rd, rd);
  fill(255);

  ellipse(ex, ey, ed, ed);
  fill(255);

  float e = dist(mouseX, mouseY, ex, ey);
  float r = dist(mouseX, mouseY, rx, ry);

  if (mousePressed == true)
  {
  ellipse(ex, ey, ed, ed);
    
    fill(255, 0, 0);
    rect(rx, ry, rd, rd);
    
    fill(0);
  }

  else
  {    
    ellipse(ex, ey, ed, ed);
    fill(255);

    rect(rx, ry, rd, rd);
    fill(255);
  }

  if (e > radius)
  {
    fill(255);
  }
  else
  {    
    background(255);
    stroke(80);
    ellipse(ex, ey, ed, ed);
  }

  if ((mouseX >rx) && (mouseX<rx+rd) &&
    (mouseY >ry) && (mouseY <ry+rd))
  {
    fill(50);
    rect(rx, ry, rd, rd);
  }
  else {
    fill(255);
  }
  
}


