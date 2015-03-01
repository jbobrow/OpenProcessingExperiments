
void setup()
{
  background(50,150,200);
  size(500,500);
  int a=1;
  int n=250;
  stroke(0);
  strokeWeight(a);
}

void draw()
{
  drawSomeQuad(); 
}

void drawSomeQuad()
{
  if (mousePressed)
  {
    //fill(random(255),random(255),random(255));
    for(int a=1; a < 50; a+=5)
    {
      strokeWeight(a/random(3,20));
      quad(a, mouseY, a, mouseY, random(500), random(500), mouseX, mouseY);
      float n=250;
      n/=1.2;
      while (n==250)
      {
        triangle(0, 500, 250, 0, 500, 500);
      }
    }
  }
  if (keyPressed)
  {
    clear();
  }
}
  



