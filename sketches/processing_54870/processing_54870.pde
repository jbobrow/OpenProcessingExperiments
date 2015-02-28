
import processing.video.*;

Capture video;
PImage bg;

int camw = 1024;
int camh = 768;
int camfps = 15;

int newX = 0;
int newY = 0;

float r;
float g;
float b;

float grabR=51;
float grabG=86;
float grabB=176;

float setR;
float setG;
float setB;

int range = 30;

void setup()
{
  size(camw, camh, P2D);
  video = new Capture(this, camw, camh, camfps);
  int rand = int(random(1,5));
  bg = loadImage("wwb" + rand +".jpg");
}

void draw()
{
  video.loadPixels();
  
  if(frameCount>camfps)
  {
    image(bg,0,0);
  }
    
  for (int x=camw-1; x >= 0; x--)
  {
    for (int y=0; y < camh; y++)
    {

      int location = x+y*camw;
      color c = video.pixels[location];

      r = red(c)+10;
      g = green(c)+10;
      b = blue(c)+10;

      if (mouseX == newX && mouseY == newY && mousePressed)
      {
        grabR = r;
        if (grabR-range < 0)
          grabR = range;
        if (grabR+range > 255)
          grabR = 255;

        grabG = g;
        if (grabG-range < 0)
          grabG = range;
        if (grabG+range > 255)
          grabG = 255;

        grabB = b;
        if (grabB-range < 0)
          grabB = range;
        if (grabB+range > 255)
          grabB = 255;
        println(grabR + " " + grabG + " " + grabB);
      }
      drawPoints(r, g, b, newX, newY);
      newY++;
    }
    newX++;
    newY = 0;
  }
  newX = 0;


  video.updatePixels();
}

void drawPoints(float r, float g, float b, int x, int y)
{
  if (r < grabR-range || r > grabR+range ||
    g < grabG-range || g > grabG+range ||
    b < grabB-range || b > grabB+range)
  {
    stroke(r,g,b);
  }
  else
  {
    noStroke();
  }
  point(x, y);
}

void captureEvent(Capture v)
{
  v.read();
}

void keyPressed()
{
  if (keyCode == UP)
  {
    if (range<100)
      range++;
  }
  else if (keyCode == DOWN)
  {
    if (range > 0)
      range--;
  }
}


