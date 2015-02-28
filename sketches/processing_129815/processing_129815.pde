
//copyright Faryal Khalid Spring 2014
//HW 3
 
//variable declarations
  float x, y;
  float wd, ht;
  float xDis, yDis;
  float easingCoef;
   
void setup()
{
  size( 400, 400);
 
  easingCoef = .06;
 
}
 
void draw()
{
  //background(0);

//blur effect on black background
  fill(0,10);

  rect(0,0,width,height);

//Random color change for Mickeys
  noStroke();
  fill(random(255), random(255), random(255), random(255));

  
  
  ellipseMode(CENTER);
  ellipse( x-wd, y-wd, wd, ht);
  
  ellipseMode(CENTER);
  ellipse( x+wd, y-wd, wd, ht);
  
  ellipseMode(CENTER);
  ellipse(x,y,wd*2,ht*2);

//movement of Mickey   
  xDis = mouseX-x;
  yDis = mouseY-y;
   
  x = x+xDis*easingCoef;
  y = y+yDis*easingCoef;
  wd = 30;
  ht = 30;
}



