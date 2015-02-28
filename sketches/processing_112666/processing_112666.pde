
PImage bruceleeImage;
boolean filterApplied = false;
void setup()
{
   size(500, 500);
   bruceleeImage = requestImage("brucelee.jpg");
   
}
void draw()
{
  if (bruceleeImage.width > 0)
  {
    imageMode(CENTER);
    if (filterApplied == false)
    {
      bruceleeImage.filter(INVERT);
      filterApplied = true;
    }
    
      image(bruceleeImage, width / 2, height / 2, width , height);
  }

 // Space between grid lines
  int gridSize = 50;
   
  // draw vertical lines
  int xx = 0;
  while (xx < width)
  {
    line(xx, 0, xx, height);
    xx += gridSize;
  }
   
  // draw horizontal lines
  int yy = 0;
  while (yy < height)
  {
    line(0, yy, width, yy);
    yy += gridSize;
  }


 float x = 100;
  float y = 200;
  float prevX = x;
  float prevY = y;
  strokeWeight(0);
  while (x < 500)
  {
    x += 5;
    y += random(-10, 10);
    line(prevX, prevY, x, y);
    prevX = x;
    prevY = y;
}
}




