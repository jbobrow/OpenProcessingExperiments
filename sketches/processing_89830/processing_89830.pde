
int x = 0, speed = 1;
int y = 0;

void setup()
{
  size(200,200);
}

void draw()
{
  background (255);
  if (mouseX <90 || mouseY <90 || mouseX > 110 || mouseY > 110)
  {
    fill(255,0,0);
    rect(x,y,20,20);
    fill(0,255,255);
    ellipse(x+5,y+5,10,5);
    ellipse(x+15,y+5,10,5);
    fill(0,255,0);
    triangle(x,y+20,x+20,y+20,x+10,y+10);
    x = x + speed;
    y = y + speed;
    if (x > width || x < 0 && y > height || y < 0)
      speed = speed * -1;
  }
}

