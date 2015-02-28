
void setup() 
{ 
  size(600,600);
  background(0,0,0);
  fill(255);
  ellipse(50,200,10,10);
  ellipse(550,200,10,10);
  ellipse(50,400,10,10);
  ellipse(550,400,10,10);
  float r=0;
  r = random(1.0);
  for (int i = 0; i<20; i++)
  {
    
    fill(0,255,0);
    ellipse(500*random(1.0)+50,200,5,5);
    r += 1.618;
    r %= 1;
    ellipse(500*r+50,400,5,5);
  }
}

void draw() 
{  
  
}
void mouseClicked()
{
  background(0,0,0);
  fill(255);
  ellipse(50,200,10,10);
  ellipse(550,200,10,10);
  ellipse(50,400,10,10);
  ellipse(550,400,10,10);
  float r=0;
  r = random(1.0);
  for (int i = 0; i<20; i++)
  {
    
    fill(0,255,0);
    ellipse(500*r+50,200,5,5);
    r += 1.618033988749895;
    r %= 1;
    ellipse(500*r+50,400,5,5);
  }
}
  

