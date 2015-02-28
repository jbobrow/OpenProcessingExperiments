
float y = 125;
float mod = 2;

void setup()
{
  size(300,270);
  background(20);
  smooth();
  frameRate(40);
}

void draw()
{
  stickMan();
  ball();
}

void stickMan()
{
  int hmod = 5;
  fill(227);
  noStroke();
  ellipse(120,60,70,70);
  rect(115,60,15,150);
  triangle(120,120,180,125,120,140);  
  rect(114,205,7,40);
  rect(124,205,7,40);
}

void ball()
{
  fill(0,0,0,60);
  rect(0,0,300,300);
  fill(255,75,4);
  ellipse(190,y,50,50);
  y = y + mod;
  
  if(y > 230)
  {
    mod = -5;
  }
  if(y < 140)
  {
    mod = 5;
  }
}
