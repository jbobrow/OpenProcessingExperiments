
//Stefan Joseph scjoseph
//Copyright July 2015 CMU PGSS

float picwidth = 75;
float x = (picwidth/2);
float y = 0;
float deltax = 3;
float deltay = 3;
PImage photo;


void setup()
{
  size (400,400);
  photo = loadImage("search.jpg");
}

void draw()
{
  background(255, 255, 255);
  
  //moving
  x += deltax;
  y += deltay;
  
  //reappearing
  if (x > width)
  {
    x = -(picwidth/2);
    y =  random(0, 325);
  }
  
  if (y > height)
  {
    x = -(picwidth/2);
    y = random( 0, 400 );
  }
  
  //appearing
  image(photo, x, y, picwidth, 75);
  
}


