
float x = 180;
float y = 225;
float mod1 = 5;
float mod2 = 1;

void setup()
{
  size(400,400);
  background(20);
  smooth();
  frameRate(30);
}

void draw()
{
  stickMan();
  ball();
}

void stickMan()
{
  int hmod = 5;
  fill(255,75,4);
  noStroke();
  ellipse(120,160,70,70);
  rect(115,160,15,150);
  triangle(120,220,180,225,120,240);  
  rect(114,305,7,40);
  rect(124,305,7,40);
}

void ball()
{
  fill(0,0,0,50);
  rect(0,0,400,400);
  fill(255);
  ellipse(x,y,20,20);
  x = x + mod1;
  y = y + mod2;
  mod2 = mod2 + .05;
  if(x > 400)
  {
    mod1 = -2;
  }
  if(x < 173)
  { 
    mod1 = 2;
  }
  if(y > 400)
  {
    mod2 = -mod2;
  }
  
}
