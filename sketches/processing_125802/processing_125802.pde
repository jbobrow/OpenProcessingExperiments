
int x;
int y;
int n;
int m;
int a;
int b;
void setup()
{
  x = 25;
  y = 25;
  n = x * 2;
  m = y * 2;
  a = x / 2;
  b = y / 2;
  background(random(225),random(225),random(225));
  size(1900,1000);
}

void draw() 
{
  ellipse(mouseX,mouseY,x,y);
}
void mouseClicked()
{
  if (mouseButton == LEFT)
  {
  m = x * 2;
  n = y * 2;
  background(random(225),random(225),random(225));
  ellipse(mouseX,mouseY,m,n);
  y = n;
  x = m;
  }
  if (mouseButton == RIGHT)
  {
  a = x / 2;
  b = y / 2;
  background(random(225),random(225),random(225));
  ellipse(mouseX,mouseY,a,b);
  y = b; 
  x = a;
  }
}
void keyPressed()
{
  if(key == BACKSPACE)
  {
    fill(random(225),random(225),random(225));
    ellipse(mouseX,mouseY,x,y);
  }
  if(key == TAB)
  {
   fill(225,225,255);
   ellipse(mouseX,mouseY,x,y);
  }
  if(key == ENTER)
  {
    rect(mouseX,mouseY,x,y);
  }
}

