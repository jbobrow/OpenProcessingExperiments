
//Matt Dawson
//HW 3
//Copright Matt Dawson Carnegie Mellon University 9/10/12

float x,y,ht,wd;

void setup()
{
  size (1200,600);
  x=100;
  y=50;
  
  smooth();
  background(0,0,0);
  
}

void draw()
{
  strokeWeight(2);
  stroke(random(256),random(256),random(256));
  line(mouseX,mouseY,random(0,1200),random(0,600));
  
  
}
  
  

