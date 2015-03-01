
boolean drawCircle = true;
 
void setup()
{
  size(400,400); 
 
  fill(255,0,255);
}
 
void draw()
{
  background(100,100,100);
 
  if (drawCircle)
  {
     ellipse(300,300,200,200); 
  }
}
 
void keyPressed()
{
  if (drawCircle)
  {
     drawCircle = false;
  }  
  else
  {
     drawCircle = true; 
  }
}
