
void setup()
{
  
  size(600,400);
  background(255,255,255);
}

void draw()
{
  
  if(key == 'r')
  {
    fill(255,0,0);
   
  }
  if(key == 'b')
  {
    fill(0,0,255);
  }
  if(key == ' ')
  {
    background(255,255,255);
  }
  if(key == 'w')
  {
    fill(255,255,255);
  }
  if(key == 'o')
  {
    fill(252,131,0);
  }
  if(key == 'g')
  {
    fill(114,232,47);
  }
  if(key == 'y')
  {
    fill(254,255,13);
  }
  if(key == 'p')
  {
    fill(177,18,227);
  }
  if(key == '[')
  {
    fill(225,10,250);
  }

if(key == 'n')
  {
    fill(0,0,0);
  }

}


void mouseDragged()
{
  noStroke();
  ellipse(mouseX,mouseY,50,50);
}
