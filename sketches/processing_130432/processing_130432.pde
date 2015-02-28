
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// ICE #3
// 1/21/14

// Declare variables
float circleDiameter;
float newCircleDiameter;
float colorR = 255;
float colorG = 0;
float colorB = 100;
float x, y;
float xdist;
float ydist;
float easingCoef;
float diameterDist;

void setup()
{
  size(600,400);
  circleDiameter = 50;
  easingCoef = .1;
  x = width/2;
  y = height/2;
}

void draw()
{
  // background
  fill(0,10);
  rect(0,0,width,height);
  
  // easing position
  xdist = mouseX-x;
  ydist = mouseY-y;
  x=x+xdist*easingCoef;
  y=y+ydist*easingCoef;
  
  // easing circle diameter
  newCircleDiameter = random(5,400);
  diameterDist = newCircleDiameter-circleDiameter;
  circleDiameter = circleDiameter+diameterDist*easingCoef;
  
  // draw ellipses
  fill(colorR,colorG,colorB);
  ellipse(x,y,circleDiameter,circleDiameter);
}

void mousePressed()
{
  colorR = random(0,255);
  colorG = random(0,255);
  colorB = random(0,255);
}



