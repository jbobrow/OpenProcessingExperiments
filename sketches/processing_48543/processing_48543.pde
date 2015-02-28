
float easing=0.5;
float easeZ=0.5;

void setup()
{
  size(500, 500);
  smooth();
  stroke(255,255, 255);
  colorMode(HSB);
}

void draw()
{
  background(255);
  translate(2*width/3.25, height/2.75);
  // decrease scale with mouseX
  //scale(1/map(mouseX,0,width,1,2));
  easeZ += (mouseX - easeZ)*easing;
  float rsz = map(easeZ, 0, width, 0, 20);
  rectField(easeZ);
  println(rsz);
}

void rectField(float easeZ)
{
  for (int i=0; i<100; i++)
  {
    translate(10+i, 10+i);
    for (float f=4; f<20; f++)
    {

      float x = easeZ*cos(radians(f));

      translate(f, f);
      fill((x), 250, 250);
      rotate(radians(easeZ*f/400));
      rect(225, 0, 200, 200);
      println(mouseX);
    }
  }
}


