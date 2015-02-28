
/* @pjs preload "myimage.png: */
PImage myimage;
PImage myimage2;
PImage myimage3;
void setup()
{
  size(1024,768);
  
  myimage = requestImage("myimage.png"); 
  myimage2 = requestImage("Myimage2.jpg");
  myimage3= requestImage("myimage3.jpg");

}

void draw()
{
  if(myimage.width > 0)
  {
    image(myimage, 0,0, width, height);
  }
  if (myimage2.width > 0)
  {
  image(myimage2, 260, 600, 400, 250);
  }
  if (myimage3.width > 0);
  {
    image(myimage3, 600, 600, 400, 250);
  }
  {
  myimage.filter(GRAY);
  myimage2.filter(GRAY);
  myimage3.filter(INVERT);
  }
  
  for (int x = 0; x < width; x += 5)
  {
    stroke(0);
    line(x, 0, x, height );
  }
    for (int y = 0; y < height; y += 5)
  {
   
    line(0, y, width, y );
  }
  stroke(#FFFF00);
  strokeWeight(10);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
  float nextX = lx + random(50);
  float nextY = ly + random(50);
  line(lx, ly, nextX, nextY);
  lx = nextX;
  ly = nextY;
 
  }
  strokeWeight(1);
}


