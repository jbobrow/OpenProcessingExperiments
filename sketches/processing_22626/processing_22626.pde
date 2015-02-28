


void setup()
{

  size(500,500);
  smooth();
  
  
}

void draw()
{
  
  
  fill(80,170,255,10);
  strokeWeight(0.1);
  
   if (mouseButton == LEFT)
    
      fill(255,175,100,8);
      
    if (mouseButton == RIGHT)
    
      fill(0,255,255,8);
  
  ellipse(mouseX,mouseY,100,100);
 ellipse(mouseX,mouseY,50,50);
 
  
}


