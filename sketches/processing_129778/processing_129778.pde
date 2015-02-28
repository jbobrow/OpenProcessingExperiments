
//Copyright Talha Aamir 2014

float x, y;
float wd, ht;
float easingCoef;
float diameter;
float r1, r2, r3;
float xDist, yDist;

void setup()
{
  size(400, 400);
  noCursor();
  easingCoef = .05; 
  background(200, 104, 54);
  wd = 200;
}

void draw()
{
   fill(200, 104, 54);  
  // x = mouseX;
  // y = mouseY;
   diameter = .3*wd;
   r1 = random(255);
   r2 = random(255);
   r3 = random(255);
   
   strokeWeight(5);
   stroke(r1, r2, r3);
   line(x, y, mouseX, mouseY);
   strokeWeight(3);
   stroke(0);
   fill(r1, r2, r3);
   ellipse(x, y, diameter, diameter);
   
   xDist = mouseX-x;
   yDist = mouseY-y;
   x = x + xDist*easingCoef;
   y = y + yDist*easingCoef;
}


