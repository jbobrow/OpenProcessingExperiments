
//Stefan Joseph scjoseph
//Copyright July 2015 CMU PGSS

  float picwidth = 75;
  float picheight = 75;
  float x = (picwidth/2);
  float y = (picheight/2);
  float deltax = 3;
  float deltay = 2;
  PImage photo;
  
void setup()
{

  size (400,400);
  photo = loadImage("search.jpg");
  imageMode( CENTER );
  
}

void draw()
{
  background(255, 255, 255);
  
  //moving
  x = x + deltax;
  y = y + deltay;
  
  image(photo, x, y, picwidth, picheight);
  
  if (x < 0 || x >= width)
 {
   deltax = -deltax;
   x = x + deltax;
 } 
  if (y < 0 || y >= height)
 {
   deltay = -deltay;
   y = y + deltay;
 }
  
  
  
}


