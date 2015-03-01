
void setup()
{
  size(1000,1000);
  background(random(255),random(255),random(255));
  rectMode(CENTER);
  fill(random(255),random(255),random(255));
  y = 0;
}

void draw()
{
  Square(50);
  Triangle(40);
  fill(random(255),random(255),random(255));
  for (float i = 5; i < 100; i = i * random(10))
  { 
    ellipse(mouseX, mouseY, i,i);
  }
}

void Square(int n)
{
  if (mousePressed)
  {
    rect(mouseX, mouseY, n, n);
  }
}

float Triangle(int d)
{
 if (keyPressed)
    {
      triangle(mouseX, mouseY, d, d, d+300, d);
    }
{
 if (d < 100)
 {
   return d;
 }
  else return 50;

}
}
