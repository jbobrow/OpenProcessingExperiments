
void setup()
{
  size(700,400);
}

float distance;

void draw()
{
  background(255);
  
  distance = dist(mouseX,mouseY,width/2,height/2);
 
  fill(0,0,255);
  
  if (distance < 150) //half size of ellipse
  {
    fill (255,0,0);
  }
  ellipse(width/2,height/2,300,300);
}

