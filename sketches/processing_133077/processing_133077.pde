
float timer = 0.0;
float backTimer = 0.0;
PImage[] slide = new PImage [16];
int backgroundIndex = 0;
PImage back;

void setup()
{
  size(500, 500);
  frameRate(30);
  
  slide[0] = requestImage("beginning.jpg");
  slide[1] = requestImage("scene 1.jpg");
  slide[2] = requestImage("scene 2.jpg");
  slide[3] = requestImage("scene 3.jpg");
  slide[4] = requestImage("scene 4.jpg");
  slide[5] = requestImage("scene 5.jpg");
  slide[6] = requestImage("scene 6.jpg");
  slide[7] = requestImage("scene 7.jpg");
  slide[8] = requestImage("scene 8.jpg");
  slide[9] = requestImage("scene 9.jpg");
  slide[10] = requestImage("scene 10.jpg");
  slide[11] = requestImage("scene 11.jpg");
  slide[12] = requestImage("scene 12.jpg");
  slide[13] = requestImage("scene 13.png");
  slide[14] = requestImage("scene 14.jpg");
  slide[15] = requestImage("scene 15.jpg");
}

void draw ()
{
  timer = timer + 1.0/30.0;

  if (timer > 4)
{
  backgroundIndex= backgroundIndex + 1;
  timer = 0;
}
if (backgroundIndex >= slide.length)
{
  backgroundIndex = 0;
}
if (slide[backgroundIndex].width > 0)
{
  printImage(slide[backgroundIndex],0,0,width,height);
}
}

void printImage(PImage img, float X, float Y, float W, float H)
{
  if (img.width > 0)
  {
    image(img,X,Y,W,H);
  }
}

void keyReleased()
{
  if (key == CODED)
  {
  if (keyCode == LEFT)
  {
    backgroundIndex = backgroundIndex - 1;
  }
  if (keyCode == RIGHT)
  {
    backgroundIndex = backgroundIndex + 1;
  }
  }
}



