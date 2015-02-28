
//copyright Irene JOung 2014
float x,y;
float wd,ht;
float xDist,yDist;
float easingCoef;
float high;

void setup()
{
  size(400,400);
  noCursor();
  easingCoef=.2;
  random(high);
}

void draw()
{
  //background(0);
  fill(0,0);
  rectMode(CORNER);
  rect(0,0,width,height);
  x=mouseX;
  y=mouseY;
  wd=random(50,20);
  ht=random(50);
  
  strokeWeight(2);
  stroke(0,0,0);
  fill(255,127,46);
  ellipse(x,y,wd,ht);
  
}


