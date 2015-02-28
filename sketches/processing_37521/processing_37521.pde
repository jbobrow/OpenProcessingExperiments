
//homework 5
//copyright EMILY SO

int y;
int x;
void setup()
{
  size(500, 500);
  strokeWeight(1);
  stroke(random(255));
  smooth();
 
}

void draw()
{
  x = mouseX/2;
  while(x > 3)
  {
    if (x/2 == 0)
    {
      noStroke();
      fill(255, 0, 0);
      ellipse(50, 50, mouseY - x, mouseX + 10);
      ellipse(300, 100, x/2, x/2);
    }
    else
    {
      fill(0, 255, 15*x);

    }
    ellipse(height/2, width/2, x/2, x/2);
    strokeWeight(mouseX/x);
    stroke(x, x, x);
    fill(random(x), random(x), random(x));
    ellipse(mouseX - 60, mouseY - 60, 15, 20);
    ellipse(height/4, width/4, x/2, x/2);
    ellipse(300, 300, x*2, x*2);
    ellipse(100, 300, x/3, x/3);
    ellipse(300, 100, x/2, x);
   
    x = x - 8;
  }

}
  //PHALE

