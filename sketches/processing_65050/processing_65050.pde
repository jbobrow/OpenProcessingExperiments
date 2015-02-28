
// Anna Lee
// DMA 28 Summer 2012
// Workshop 3

float rx, ry;    // rectangle x- and y-coordinate (CENTER)
float rd = 100;  // rectangle width
float rc = 1.0;  // rectangle color control 

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
float ec = 1.0;  // ellipse color control

float easing = 0.02;

float targetX, targetY;

void setup() 
{
  size(640, 360);
  smooth();
  rectMode(CENTER);
   
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33; // modified for rectMode(CENTER)
  ry = height * 0.5; // modified for rectMode(CENTER)
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
void draw() 
{
  background(102);
  
  // draw rectangle
  fill(255, rc*255, rc*255);
  rect(rx, ry, rd, rd);
  
  // draw ellipse
  fill(255, 255, ec*255);
  ellipse(ex, ey, ed, ed);
  
  // mouse over rectangle
  if (mouseX > rx-rd/2 && mouseX < rx+rd/2 && mouseY > ry-rd/2 && mouseY < ry+rd/2)
  {
    if (mousePressed)
    {
      // target is mouse position
      targetX = mouseX;
      targetY = mouseY;
    }
    else
    {
      // target is mouse position reflected across current center
      targetX = rx + (rx-mouseX);
      targetY = ry + (ry-mouseY);
    }
    
    // ease to target position   
    rx += (targetX - rx) * easing;
    ry += (targetY - ry) * easing;
       
    // ease color from white to red based on mouse position distance from center    
    float targetC = map(dist(mouseX, mouseY, rx, ry), 0, rd/2, 0.0, 1.0);
    rc += (targetC-rc) * easing;
  }
  
  // mouse over ellipse
  if (dist(mouseX, mouseY, ex, ey) < ed/2)
  {
    if (mousePressed)
    {
      // target is mouse position reflected across current center
      targetX = ex + (ex-mouseX);
      targetY = ey + (ey-mouseY);
    }
    else
    {
      // target is mouse position
      targetX = mouseX;
      targetY = mouseY;
    }
    
    // ease to target position
    ex += (targetX - ex) * easing;
    ey += (targetY - ey) * easing;

    // ease color from white to yellow based on distance of mouse position from center
    float targetC = map(dist(mouseX, mouseY, ex, ey), 0, ed/2, 0.0, 1.0);
    ec += (targetC-ec) * easing;
  }
}

