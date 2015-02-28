

void setup()
{
  size(900,450);
  background(0);
  
}
  
void draw()
{   
  stroke(255,0,0,random(100));
  if(mouseX>0 && mouseY>0)
  
  { 
     line(mouseX,mouseY,random(500),random(500));
 
  }
  
  
  
}
