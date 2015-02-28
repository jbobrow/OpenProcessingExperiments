
void setup (){
  size (281,425);
}
float x = 5;
float y = 5;

void draw ()
{
  x = x + .5;
  if (x > 70) {
    x = 5;
  }

  y = y + .5;
  if (y > 70) {
    y = 5;
  }

  background (255);
  PImage b;
  b = loadImage ("pablo.jpg");
  image (b,0,0);


  fill (255,3,3,150);
  ellipse (87,260,x,y);
}



