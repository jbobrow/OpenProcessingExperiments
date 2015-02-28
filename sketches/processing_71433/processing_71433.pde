
//Alvin Ha, Computer Programming, Mr. Simon, 4-5
// USER INPUT


int x = 0;
int y = 0;
int xChange = 1;
int yChange = 1;
void setup ()
{
  size(400, 400);
}

void draw()
{
  if (mousePressed == true)
  {
    fill(0, 0, 0);
    rect(0, 0, 400, 400);
    noStroke();
    smooth();
    fill(random(255), random(255), random(255));
    ellipse(random(400), random(400), mouseX, mouseY);
    fill(random(255), random(255), random(255));
    ellipse(400-mouseX, 400-mouseY, 400-mouseX, 400-mouseY);
    fill(random(255), random(255), random(255));
    triangle(mouseX, mouseY, mouseY, mouseX, 210, 210);
    fill(random(255), random(255), random(255));
    triangle(0, 0, mouseY, mouseX, mouseY, mouseX);
  }
  if (keyPressed == true)
  {

    strokeWeight(10);
    stroke(random(255), random(255), random(255));
    noFill();
    ellipse(x, y, 30, 30);
    ellipse(y,x,30,30);
    ellipse(x+y,x+y,30,30);
    ellipse(50+x,50+y,30,30);
    ellipse(50-x,50-y,30,30);
    ellipse(350-x,350-x,30,30);
    ellipse(350+x,350-x,30,30);
    ellipse(random(400),random(400),30,30);
    x = x + xChange;
    y = y + yChange;
    if (x < 200)
    {   
      xChange = xChange + 1;
    }
    if (x >=200)
    {
      xChange = xChange - 1;
    }
    if (y <391)
    {
      yChange = yChange + 1;
    }
    if (y > 5);
    {
      yChange = yChange - 1;
    }
  }
}
