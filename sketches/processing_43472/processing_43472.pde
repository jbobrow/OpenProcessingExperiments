
float easing=0.1;
float easeX=0.1;
//float rsz = 0;
//float rColor = 0;
//float randC = 0;

void setup()
{
  size(600, 600);
  smooth();
  ellipseMode(CENTER);
  noStroke();
  colorMode(HSB);
}

void draw()
{
  background(255);
  translate(2*width/3.25, height/2.75);
  // decrease scale with mouseX
  //scale(1/map(mouseX,0,width,1,2));
  easeX += (mouseX - easeX)*easing;
  float rsz = map(easeX, 0, width, 0, 36);
  rectField(easeX);
  println(rsz);
}

void rectField(float easeX)
{
  for (int i=0; i<100; i++)
  {
    translate(10+i, 10+i);
    for (float f=0; f<10; f++)
    {

      float x = easeX*cos(radians(f));
      float y = easeX*sin(radians(f));

      translate(f, f);
      fill(random(x-100,x), 200, 200);
      rotate(radians(easeX*f/400));
      ellipse(0, 0, f, f);
      println(mouseX);
    }
  }
}


