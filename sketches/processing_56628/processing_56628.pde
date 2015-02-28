


// for en dues dimensions
int costat = 40;

void setup()
{
  size(480, 440);
  background(255);
  smooth();


  noStroke();

  for (int x=0; x<width; x+=costat)
  {
    for (int y=0; y<height; y+=costat)
    {
      fill(random(255), random(255), random(255));
      // comenta aquesta linia i descomenta les dues de despres
      //rect(x, y, costat, costat);

      float l = costat - random(5);
      rect(x, y, l, l);
    }
  }
}

void draw()
{
  int x, y;
  for (x=0;x<width;x+=costat)
  {
    for (y=0;y<height;y+=costat)
    { 
      if (mouseX>x && mouseX<(x+costat) && mouseY>y && mouseY<(y+costat))
      {
        if (mousePressed)
        {
          fill(255, 255, 255);
          stroke (0, 0,0);
          strokeWeight(1.6);
          rotate(random (9));
      

          // comenta aquesta linia i descomenta les dues de despres
          rect(x-10, y-10, random(100), random(100));

          //float a=random(50);
          //rect(x-10, y-10, a, a);
        }
      }
    }
  }
}

