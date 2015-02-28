
//Copyright Miranda Jacoby 2014 All Rights Rserved

float x;
float y;
float wd;
float ht;
float r;
float rFill;
//float xDist;
//float yDist;
//float easingCoef

void setup () {
size(400, 400);
background(255);
}

void draw () {
  
  x = mouseX;
  y = mouseY;
  wd = 50;
  ht = 50;
  r = random (0, 50);
  rFill = random (0, 255);
  fill(r);
  ellipse(x, y, r, r);
}

void mousePressed () {
  background(255);
}





