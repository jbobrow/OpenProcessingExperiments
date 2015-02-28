
//Di T,RandomWalk,CP1, 14-15
PImage audi;
PImage onion;

float x=0;
float y=0;
float a=206;
float b=122;

void setup()
{
 
 size(512,384);
 audi = loadImage("http://4.bp.blogspot.com/-Ma9Mh9O-CvA/UEQzn1aRwZI/AAAAAAAAAg8/1VnklSIoLH8/s1600/Audi-R8-1.jpg");
 onion = loadImage("http://4.bp.blogspot.com/_ufssovpKS8Q/SS1PVxmdaGI/AAAAAAAAAPI/aqvZdSYruoY/s400/onion+head+36.gif");
}
void draw()
{
  background(148,148,148);
  image (audi, x, y, width,height);
  x = x + int(random(-2,2));
  y = y + int(random(-2,2));

  if (mousePressed==true)
  {
   background(255);
   image (onion, a, b);
   a = a + int(random(-2,2));
   b = b + int(random(-2,2));
  }
}
