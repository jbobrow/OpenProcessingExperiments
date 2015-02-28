
//by mei 

float x, y;
float a=0;
float b=34;
float c=100;

void setup()
{
  size (800, 600);
  smooth();
  background(#F5F6F7);
  strokeWeight (10) ;
  //x = y = 200;
}


void draw()
{
  // noStroke();
  //stroke (h, s, b);
  //stroke (#7E3AAF);
  noStroke();
  colorMode(RGB);

  if (mousePressed)
  {
    stroke(random (0, 400));
  }
  line (mouseX, mouseY, random (200, 400), random ( 600, 400));
  line (mouseX, mouseY, random (0, 0), random ( 0, 0 ));
  line (mouseX, mouseY, random (height/2, width/2), random ( 0, 0 ));
}


