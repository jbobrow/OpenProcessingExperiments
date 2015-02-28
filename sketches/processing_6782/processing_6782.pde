
/**
 * <h3>2D Transformations</h3>
 * Rotating a point from position (o.x, o.y) to position (oR.x, oR.y) <br>
 * through an angle "theta" about pivot point (oP.x, oP.y) <br>
 * <h4>Usage:</h4>
 * Left click to position the object<br>
 * Right click to position the pivot point<br>
 * 
 * Jan 03, 2010 - Satish Goda - satishgoda@gmail.com
 */

PVector worldOrigin;
PVector worldScale;

PVector o = new PVector(0,0);
PVector oP = new PVector(100, 100);
PVector oR = new PVector();

void setup()
{
  size(640, 480);
  background(0);
  smooth();
  frameRate(60);
  
  worldOrigin = new PVector(width/2.0, height/2.0);
  worldScale = new PVector(1, -1);
}

void drawAxes()
{
  stroke(255, 0, 0);
  line(0, worldOrigin.y, width, worldOrigin.y);
  stroke(0, 255, 0);
  line(worldOrigin.x, 0, worldOrigin.x, height);
}

void draw()
{
  stroke(0);
  fill(0, 15);
  rect(0, 0, width, height);
  drawAxes();
  translate(worldOrigin.x, worldOrigin.y);
  scale(worldScale.x, worldScale.y);


  // Pivot point
  stroke(0, 0, 0);  
  fill(255);
  ellipse(oP.x, oP.y, 8, 8);

  // Object's base location
  stroke(255, 255, 0);  
  fill(127, 127, 127, 127);
  ellipse(o.x, o.y, 25, 25);

  // Calculate rotation of the object about pivot point 
  float theta = radians(frameCount);
  float cosTheta = cos(theta);
  float sinTheta = sin(theta);

  oR.x = oP.x + (o.x - oP.x)*cosTheta - (o.y - oP.y)*sinTheta;
  oR.y = oP.y + (o.x - oP.x)*sinTheta + (o.y - oP.y)*cosTheta;

  stroke(255, 255, 0);
  fill(255, 0, 0);
  ellipse(oR.x, oR.y, 25, 25);

  // Draw line between object and pivot
  stroke(127, 127, 127, 75);
  line(oP.x, oP.y, oR.x, oR.y);
}

void mouseReleased()
{
  float mx = worldScale.x*(mouseX - worldOrigin.x);
  float my = worldScale.y*(mouseY - worldOrigin.y);

  switch(mouseButton) {
  case LEFT:
    o.set(mx, my, 0);
    break;
  case RIGHT:
    oP.set(mx, my, 0);
    break;
  }
}
















