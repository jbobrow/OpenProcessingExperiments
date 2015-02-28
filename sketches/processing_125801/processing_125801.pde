
int x;
float y;
int z;
int w;
int n;
void setup()
{
  w = int(random(13));
  x=0;
  y=200;
  n=0;
  size(800,800);
}

void draw()
{
  background(0,n,100);
  fill((mouseX*1.0)/(height/255),(mouseY+mouseX)*1.0/(width/255)+(height/255),(mouseY*1.0)/(width/255));
  ellipse(mouseX,mouseY,y,y);
  fill((mouseY*1.0)/(height/255),(mouseX+mouseY)*1.0/(width/255)+(height/255),(mouseX*1.0)/(width/255));
  ellipse(mouseY,mouseX,y,y);
  if (n >= 255)
  {
    for (int i = 0; i < 255; i = i + w)
    {
      n = n - w;
    }
  }
  if (n <= 0)
  {
    for (int i = 0; i < 255; i = i + w)
    {
      n = n + w;
    }
  }
}

void keyPressed()
{
  if (y == 200)
  {
    y = random(600);
  }
  else {
    y = 200;
  }
}
