
//copyright Yoon-ji Kim
//51-257 A, HW#3

float x, y;
float wd, ht;
float easingCoef;

void setup()
{
  size(400, 400);
  noStroke();
  frameRate(20);
  noCursor();
  smooth();
}

void draw()
{
  easingCoef = .2;
  x = mouseX;
  y = mouseY;
  wd = 50;
  ht = 50;
  
  //BG color effect
  if(mousePressed == true)
  {
    background(random(255), random(255), random(255));
  }
  else
  {
    background(0);
  }
  
  //cursor ellipse
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, wd, ht);
}


