
// Homework 3
// Lincoln He_Communication Design 2014_CMU_PGH

float x, y, wd, ht;
color col;

// no varibles, use magic numbers
void setup()
{
  size (400, 400);
  x= 0;
  y=height*.6;
  wd = width*.35;
  ht= height*.43;
  
  frameRate(70);
  noStroke();
  
  
}


void draw()
{
  //background (200, 200, 0);
  //ellipse (x, y, wd, ht);
 // x =x + 1;
 
 fill (200,30,0,10);
 rect(0,0, width, height);
 //fill(0,0,255);
 fill (random(255), random(255), random(255));
 //ellipse (x, y, wd, ht);
 //x =x + 1;
 ellipse(mouseX, mouseY, mouseX-mouseY, random (width));
 

bezier(mouseX, mouseX*.2, mouseX-mouseY, mouseY*.6, mouseX*.6, mouseY*.2, mouseY, mouseY-mouseX);
int steps = 6;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  // Get the location of the point
  float x = bezierPoint(mouseX, 10, mouseX, 15, t);
  float y = bezierPoint(20, 10, 90, 80, t);
  // Get the tangent points
  float tx = bezierTangent(mouseY, 10, mouseY, 15, t);
  float ty = bezierTangent(20, 10, 90, 80, t);
  // Calculate an angle from the tangent points
  float a = atan2(ty, tx);
  a += PI;
  
  //line(x, y, cos(a)*30 + x, sin(a)*30 + y);
  // The following line of code makes a line 
  // inverse of the above line
  //line(x, y, cos(a)*-30 + x, sin(a)*-30 + y);
  noStroke();
  ellipse(x, y, 10, 10);
}

}


