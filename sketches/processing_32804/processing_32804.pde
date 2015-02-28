
void setup()
{
  size(500,500);  
  noStroke();
  smooth();  
}
    
int robbie=0;
int julio=500;

void draw()
{
  
  background(212);
  fill(88,103,255,200);
  ellipse(robbie,robbie,150,150);
  fill(255);
  ellipse(robbie+30,robbie+5,28,28);
  fill(0);
  ellipse(robbie+36,robbie+10,8,8);
  fill(212);
  ellipse(robbie+18,robbie+60,60,60);
  
  fill(255,24,13,200);
  ellipse(julio,julio,150,150);  
  fill(255);
  ellipse(julio-5,julio-45,28,28);
  fill(212);  
  ellipse(julio-48,julio-18,60,60);
  fill(0);
  ellipse(julio-13,julio-47,8,8);
  
  
  robbie=robbie+3;
  julio=julio-3;
  if(robbie>250){robbie=0;}
  if(julio<250){julio=500;}
}  

