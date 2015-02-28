
int x,y;
int xspeed,yspeed;
int ellipseRadius;

void setup()
{
 size(200,500);
 smooth();
 ellipseMode(CENTER);
 x=60;
 y=10;
 xspeed=1;
 yspeed=3;
 ellipseRadius = 10;
 noStroke();
}

void draw()
{
  fill(255,15); //fill(brightness, transparency)
  rect(0,0,width,height); //semi-transparent rectangle instead of opaque bg. 
//  background(150,150,1); 

  x=x+xspeed;
  y=y+yspeed;
  if(y>=height-ellipseRadius || y<=ellipseRadius)
  {
    yspeed=yspeed*-1;
  }
  if (x>=width-ellipseRadius || x<=ellipseRadius)
  {
    xspeed=xspeed*-1;
  }
 
  fill(255,0,0);
  ellipse(x,y,ellipseRadius*2,ellipseRadius*2); 
}


