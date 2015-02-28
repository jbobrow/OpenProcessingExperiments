
void setup()
{
  size(600,500);
  background(255);
  noStroke();
  fill(0);
  
}


void draw()
{
  for(int i = 0; i < 13; i++ )
  {
  rect(10,10+i*60,width-i*60,20);
  }
  
  for(int u = 0; u < 13; u++ )
  {
  rect(10+u*60,10,20,height-u*40);
  }
  
}

