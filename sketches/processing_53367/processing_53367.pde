
import processing.video.*;

Capture video;

int camw = 640;
int camh = 480;
int camfps = 15;

int newX = 0;
int newY = 0;
int jumpX = 1;
int jumpY = 1;

void setup()
{
  size(jumpX*camw, jumpY*camh, P2D);
  video = new Capture(this, camw, camh, camfps);
  noStroke();
  //strokeWeight(1);
}

void draw()
{
  video.loadPixels();

  for (int x=camw-1; x >= 0; x--)
  {
    for (int y=0; y < camh; y++)
    {

      int location = x+y*camw;
      color c = video.pixels[location];

      drawPoints(c, newX, newY);
      newY+=jumpY;
    }
    newX+=jumpX;
    newY = 0;
  }
  newX = 0;

  video.updatePixels();
}

void drawPoints(color c, int x, int y)
{
  /*float r = red(c);
  float g = green(c);
  float b = blue(c);*/
  float r = green(c)+blue(c);
  float g = red(c)+ blue(c);
  float b = red(c)+ green(c);
  if(r < 25) r = 0;
  if(g < 25) g = 0;
  if(b < 25) b = 0;
  /*if(red(c) > 250 && green(c) > 250 && blue(c) > 250)
  {
    r = random(255);
    g = random(255);
    b = random(255);
  }*/

  stroke(r, g, b);
  point(x,y);
}

void captureEvent(Capture v)
{
  v.read();
}

void keyPressed()
{
  
}


