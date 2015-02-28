
float xoff = 200.0;

void setup()
{
  size(500,500);
  background(204);
  colorMode(HSB);
  smooth();
}

void draw() 
{
  background(cos(xoff)*100);
  xoff = xoff + .005;
  for(float i=0; i < 1; i+=.01)
  {
    lines(xoff/i);
  }
}

void lines(float off)
{
  float h = noise(off+.05);
  float r = noise(off);
  float n = r * width;
  float p = h * height;
  strokeWeight(abs((n-width)*.5));
  stroke(p, off*h*100/2, 500*h + 50 , 200*r);
  line(p, -width, n, width*2);
  strokeWeight(abs((p-height)*.5));
  stroke(n, off*r*100/2, 500*h +50, 200*h);
  line(-height, n, height*2, p); 
//  ellipse();
}










