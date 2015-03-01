
int x;

void setup()
{
  background(random(255),random(255),random(255));
  size(500,500);
  x = 0;
}

void draw()
{
  for (int i = 0; i < 500; i = i+50) 
  {
    line(0, i, 500, i);
  }

  if (x > 500)
  {
    x = 0;
  }
  else
  {
    ellipse(mouseX,mouseY,computeRandom(5),computeRandom(5));
    x+=1;
  }
  //draws to screen
}

void keyPressed()
{
  background(200,23,23);
  ellipse(mouseX,mouseY,25,25); 
}

void mousePressed()
{
  background(20, 200, 23);
  for (int i = 0; i < 200; i++) 
  {
    float r = random(100);
    stroke(r*8);
    line(0, i, 500+r, i);
  }
  float y = 0;
  float alex = 2;
  while (y<300)
  {
    rect(y,y,30,30);
    rect(0-y,0,20,20);
    y+=alex;
  }
}

int computeRandom(int n)
{
  if(n > 10)
  {
    return n;
  }
  else
  {
    return int(random(100)) + 100;
  }
}
