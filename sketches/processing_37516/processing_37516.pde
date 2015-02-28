
//Homework 5
//Copyright Yoni Afek , Sept 14, 2011 Carnegie Mellon

int x=0;
int y=25;
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
  y=0;

 
  while (y<=width)
  {
    
    noFill();
    fill(20);
    rect(x, y, 400, 400);
    strokeWeight(10);
    stroke(random(256),random(256), random(256),40);
     
    y=y+2;
    x=x+3;
    
    noFill();
    rect(x, y, 300, 100);
    strokeWeight(10);
    stroke(random(256),random(256), random(256),40);
    
    noFill();
    rect(x, y, 100, 300);
    strokeWeight(10);
    stroke(random(256),random(256), random(256),40);

  }
   
   
  
}


