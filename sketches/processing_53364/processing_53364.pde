
import processing.video.*;

Capture video;

int camw = 640;
int camh = 480;
int camfps = 15;

int newX = 0;
int newY = 0;
int jumpX = 1;
int jumpY = 1;

int cSeed = 5;
int lSeed = 10;

int cWindowA = 150;
int cWindowB = 50;

void setup()
{
  size(jumpX*camw, jumpY*camh, P2D);
  video = new Capture(this, camw, camh, camfps);
  strokeWeight(1);
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
  float r = red(c);
  float g = green(c);
  float b = blue(c);

  if (x <= width/2 && y <= height/2)
  {
    if (r > cWindowA || g > cWindowA || b > cWindowA)
    {
      r = 140;
      g = 206;
      b = 240;
    }
    else if ((r>cWindowB && r<cWindowA)|| (g>cWindowB && g<cWindowA) || (b>cWindowB && b<cWindowA))
    {
      r = 107;
      g = 155;
      b = 180;
    }
    else
    {
      r = 74;
      g = 108;
      b = 126;
    }
  }
  if (x > width/2 && y <height/2)
  {
    if (r > cWindowA || g > cWindowA || b > cWindowA)
    {
      r = 107;
      g = 180;
      b = 129;
    }
    else if ((r>cWindowB && r<cWindowA)|| (g>50 && g<cWindowA) || (b>50 && b<cWindowA))
    {
      r = 80;
      g = 137;
      b = 96;
    }
    else
    {
      r = 45;
      g = 77;
      b = 55;
    }
  }
  if (x <= width/2 && y >=height/2)
  {
    if (r > cWindowA || g > cWindowA || b > cWindowA)
    {
      r = 240;
      g = 224;
      b = 104;
    }
    else if ((r>cWindowB && r<cWindowA)|| (g>cWindowB && g<cWindowA) || (b>cWindowB && b<cWindowA))
    {
      r = 201;
      g = 188;
      b = 87;
    }
    else
    {
      r = 155;
      g = 144;
      b = 66;
    }
  }
  if (x > width/2 && y >height/2)
  {
    if (r > cWindowA || g > cWindowA || b > cWindowA)
    {
      r = 232;
      g = 96;
      b = 75;
    }
    else if ((r>cWindowB && r<cWindowA)|| (g>cWindowB && g<cWindowA) || (b>cWindowB && b<cWindowA))
    {
      r = 193;
      g = 80;
      b = 62;
    }
    else
    {
      r = 142;
      g = 59;
      b = 46;
    }
  }
  stroke(r, g, b);
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
    lSeed++;
  }
  if (keyCode == DOWN)
  {
    lSeed--;
  }
}


