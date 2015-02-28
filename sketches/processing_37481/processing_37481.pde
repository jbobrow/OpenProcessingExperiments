
//hw5 CMU 48-757 F'11 
//copywrite Zack Jacobson-Weaver 2011
int x=0;
int y=25;
int z=y/2;
int c=y/5;
color col;

void setup()
{
  size (400,400);
  smooth();
  col=color(random (55), random (128),random (128));
  frameRate(30);
}

void draw()
{
  fill(0);
  rect(0, 0, 400, 400);
  x=0;
 y=25;
 z=y/2;
 c=y/5;

  while (y<=400)
  {
    strokeWeight(random(10));
    stroke(random(256),random(256), random(256),random(99));
    line(400,y-25,0,400);
    
    y=y+4;
  }
  
  
    while (x<= 400)
    {
    strokeWeight(random(10));
    stroke(random(256), random(256),random(256),random(99));
    line(x,0,2,400);
  
  x=x+4;
  
}
}



