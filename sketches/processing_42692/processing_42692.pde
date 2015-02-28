
int x=0;


void setup()
{
  size(800, 800);
  smooth();
  background (255);
}


void draw()
{

  if (millis()> 3000) {
    x++;
    rotate(radians(frameCount * 2  % 360));



    //logo
    stroke (114, 16, 23);
    strokeWeight (15);
    strokeCap (ROUND);
    scale (0.25);
    line ( 326, 307, 441, 307);
    line ( 441, 307, 441, 473);
    line ( 326, 377, 441, 377);
    line (326, 377, 326, 545);
    strokeCap (ROUND);
    line (326, 456, 441, 456);
  }
}


