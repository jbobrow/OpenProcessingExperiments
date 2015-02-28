
float xstep = 10;
float ystep = 10;
float lastx = 20;
float lasty = 50;
float y = 50;

void setup()
{
  size(800, 600);
  background(100, 180, 70);
}
void draw()

{
  if (mousePressed == true) {
    background(100, 180, 70);
  }

  else if(mousePressed == false)
  {
    for (int x=20; x<=(width-20); x+=10) {
      ystep=random(20)-10;
      y+=ystep;
      line(x, y, lastx, lasty);
      lastx = x;
      lasty = y;
    }
  }
}



