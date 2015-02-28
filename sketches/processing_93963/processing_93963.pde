
// Hyun Woo Jo
// Copyright, Hyun Woo Jo 2013 Mar
// hyunwooj@andrew.cmu.edu
 
float x, y;
 
void setup()
{
  size(400, 400);
  background(77,185,255);
   
}
 
void draw()
{
  drawFor();  
  drawWhile();
    
}
 
 
void drawWhile()
{
  int c = 0;
   
  while (x<width*1.3)
  {
    fill(0,c);
    noStroke();
    
    x = c*sin(c)+width/2;
    y = c*cos(c)+height/2;
    ellipse(x, y, (c^2)*0.2,(c^2)*0.2);
    c=c+1;
  }
}
 
 
void drawFor()
{
   
  for (int i = 0; i<width*1.5; i = i+80)
  {
    stroke(160,210,245);
    strokeWeight(20);
    noFill();
    ellipse(width/2,height/2,i,i);
  }
}
 
void keyPressed()
{
}



