
//Isaiah Baiseri
//UCLA DMA 28
//Summer 2012

float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
 
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
 
void setup() {
  size(640, 360);
  smooth();
  background(0);
  noStroke();
 
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
 
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;

}
 
void draw()
{
  //original circle
  int r = 100;
  fill(255,255,255);
  ellipse(160, 180, r, r);
  float d = dist(160, 180, mouseX, mouseY);
 
  //original rectangle
  fill(255);
  rect(400, 130, 100, 100);
 
  //circle hover
  if (d <= r/2)
  {
    background(255, 255, 0);
    rect(400, 130, 100, 100);
    for (int i = 0; i <= width; i += 15)
    {
      stroke(i, 0, 255);
      ellipse(i, height, mouseX, mouseY);
      ellipse(width, i, mouseX, mouseY);
      ellipse(i, 0, mouseX, mouseY);
      ellipse(0, i, mouseX, mouseY);
    }
  }

  //rectangle hover
  if (mouseX>=400 && mouseX<=500 && mouseY>=130 && mouseY<=230)
  {
    background(0, 255, 255);
    ellipse(160, 180, r, r);
    for (int i = 0; i <= width; i += 15)
    {   
      stroke(255, i, 0);
      ellipse(i, height, mouseX, mouseY);
      ellipse(width, i, mouseX, mouseY);
      ellipse(i, 0, mouseX, mouseY);
      ellipse(0, i, mouseX, mouseY);
    }
  }
 
  //reset
  if (mousePressed)
  { 
    background(0);
    rect(400, 130, 100, 100);
    ellipse(160, 180, r, r);
    noStroke();
  }
}


