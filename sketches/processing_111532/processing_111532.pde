
PImage myImage;
boolean alreadyInvert = false;
 
void setup()
{
  size(500, 500);
  myImage = requestImage("me.jpg");
}
 
void draw()
{
  // Loading Background
  if (myImage.width > 0)
  {
    if (alreadyInvert == false)
    {
      myImage.filter(INVERT);
      alreadyInvert = true;
    }
    image(myImage, 0, 0, width, height);
  }
  {
  noFill();
  stroke(227, 0, 224);
  strokeWeight(5);
  ellipse(250, 215, 120, 220);
  fill(48, 198, 26);
  stroke(255, 0, 0);
  rect(400, 25, 80, 80);
  rect(25, 25, 80, 80);
  rect(25, 400, 80, 80);
  rect(400, 400, 80, 80);
  }
  strokeWeight(2);
  for (int x = 0; x < 500; x = x + 15)
  {
    line(0, x, 500, x);
    stroke(152, 54, 29);
  }
  for (int y = 0; y <500; y = y + 15)
  {
    line(y, 0, y, 500);
    stroke(152, 54, 29);
  }
  float lx = 175.0;
  float ly = 400.0;
  while(lx < width)
  {
   float ax = lx + random(10);
   float ay = ly + random(-30);
   line(lx, ly, ax, ay);
   ly = ay;
   lx = ax;
   stroke(0, 0, 0);
   strokeWeight(5);
   }
   float xx = 0.0;
   float yy = 0.0;
   while(yy < height)
   {
     float dx = xx + random(100);
     float dy = yy + random(100);
     line(dx, dy, xx, yy);
     ellipse(dx, dy, 100, 100);
     xx = dx;
     yy = dy;
     stroke(255, 0, 0);
     strokeWeight(7);
   }
   float rx = 500.0;
   float ry = 0.0;
   while(ry < height)
   {
     noFill();
     stroke(0, 0, 0);
     float tx = rx + random(-100);
     float ty = ry + random(100);
     line(tx, ty, rx, ry);
     rect(tx, ty, 100, 100);
     rx = tx;
     ry = ty;
     stroke(255, 0, 0);
     strokeWeight(7);
   }     
}


