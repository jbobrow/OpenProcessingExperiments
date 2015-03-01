
void setup() 
{
  background(doge(255),random(255),random(255));
  size(500,500);
  strokeWeight(1);
  fill(255,255,255);
}

void draw()
{
  //circles(100);
}

void mousePressed()
{
  if (mousePressed) 
  {
    float x=0;
    float a=50;
    while (x<500)
    {
      strokeWeight(1);
      rect (mouseX,mouseY,10,10);
      x+=a;
    }
  }
}
  

void keyPressed() 
{
  if (true) 
  {
    fill(255);
    ellipse(mouseX,mouseY,50,50);
  }
  if (key == 'r')
  {
    background(random(255),(255),(255));
  }
  int s = 1;
  for (int i = 0; i < 40; i = i+1) 
  { 
    rect(0,0,20,20);
    strokeWeight(1+s);
    s=s+1;
  }
}
float doge(int v)
{
  if (v<500)
  {
    return v;
  }
  else 
  return (random(255));
}

