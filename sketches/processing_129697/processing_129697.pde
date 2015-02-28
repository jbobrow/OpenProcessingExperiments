
//HW_2 - Tues/Thurs 11:30
//Copyright J William Gott 2014


float x, y;
float wd, ht;
float xDist, yDist;
float easingCoef;


void setup ()
{
    size (400,400);
    easingCoef = .3;
    noCursor();
}

void draw ()
{
  
  wd = random(20);
  ht = random(60);
  x = x+xDist*easingCoef;
  y = y+yDist*easingCoef;
  xDist = mouseX - x;
  yDist = mouseY - y;
  easingCoef = .3;

  fill(0,10);
  rectMode (CORNER);
  rect(0,0, width, height);
  
  
  noStroke();
  fill(200,0,0);
  ellipseMode(CENTER);
  ellipse (x-20,y-40, wd, ht);
  
  ellipseMode(CENTER);
  ellipse (x+20,y-40, wd, ht);
  
  ellipseMode(CENTER);
  ellipse (x+20,y+40, wd, ht);
 
  ellipseMode(CENTER);
  ellipse (x-20,y+40, wd, ht);
  
  fill(0,200,0);
  ellipseMode(CENTER);
  ellipse(x,y,5,5);
  
}
