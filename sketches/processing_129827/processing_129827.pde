
int x;
int y;
void setup()
{
  size(1000,1000);
  background(0);
}

void draw()
{
  x = 200;
  y = 50;
  fill(random(255),random(255),random(255));
  stroke(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,x,y);
  while (keyPressed == true);
  {
   if (key == UP)
   {
     y += 2;
   }
  } 
}

void mouseClicked()
{
  if (mouseButton == LEFT)
  {
    background(100,0,0);
    fill(0,100,0,200);
    ellipse(500,500,random(500),random(500));
  }
  if (mouseButton == RIGHT)
  {
    background(0);
    fill(random(255),random(255),random(255));
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
    ellipse(random(1000),random(1000),20,20);
  }
}
