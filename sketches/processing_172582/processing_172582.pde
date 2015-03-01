
void setup()
{
  size(500,500);
  background(100,255,0);
  strokeWeight(4);
  
  for (int i = 0; i < 800; i = i+5) 
  {
    line(0,i,500,i);
  }
  float x = 0;
  float delta = 50;
  while (x<500)
  {
    rect(x,x,10,10);
    rect(x+40,x+40,10,10);
    x+=delta;
  }  
}
void draw()
{
  ellipse(mouseX,mouseY,computeRandom(1)/15,computeRandom(1)/15);
  for (int d = 0; d < 500; d++) 
  {
    float r = random(500);
    stroke(d-250);
    ellipse(d-100,r-100,1,1);
    fill(computeRandom(1),computeRandom(1),0);
  }
  
}
void mousePressed()
{
  background(computeRandom(1),computeRandom(1),computeRandom(1));
  for (int i = 0; i < 800; i = i+5) 
  {
    line(0,i,500,i);
  }
  float x = 0;
  float delta = 50;
  while (x<500)
  {
    rect(x,x,10,10);
    rect(450,x,10,10);
    rect(5+x,450,10,10);
    x+=delta;
  }
}
int computeRandom(int n)
{
  if (n > 10)
  {
    return n;
  }
  else
  {
    return int(random(255));
  }
}
void keypressed()
{
  ellipse(450,450,400,400);
}
