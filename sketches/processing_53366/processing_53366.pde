
import processing.video.*;

Capture video;

int camw = 640;
int camh = 480;
int camfps = 15;

int newX = 0;
int newY = 0;

float r;
float g;
float b;

float grabR;
float grabG;
float grabB;

float setR;
float setG;
float setB;

int range = 15;

void setup()
{
  size(camw, camh, P2D);
  video = new Capture(this, camw, camh, camfps);
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

      r = red(c);
      g = green(c);
      b = blue(c);

      if (mouseX == newX && mouseY == newY && mousePressed)
      {
        grabR = r;
        if (grabR-range < 0)
          grabR = range;
        if (grabR+range > 255)
          grabR = 255-range;

        grabG = g;
        if (grabG-range < 0)
          grabG = range;
        if (grabG+range > 255)
          grabG = 255-range;

        grabB = b;
        if (grabB-range < 0)
          grabB = range;
        if (grabB+range > 255)
          grabB = 255-range;
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
  if (r > grabR-range && r < grabR+range &&
    g > grabG-range && g < grabG+range &&
    b > grabB-range && b < grabB+range)
  {
    r = setR;
    g = setG;
    b = setB;
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
    if (range<100)
      range++;
  }
  else if (keyCode == DOWN)
  {
    if (range > 0)
      range--;
  }

  switch(key) {
  case 'r':
    setR = 193;
    setG = 16;
    setB = 19;
    break;
  case 'g':
    setR = 50;
    setG = 139;
    setB = 27;
    break;
  case 'b':
    setR = 28;
    setG = 61;
    setB = 175;
    break;
  case 'y':
    setR = 245;
    setG = 224;
    setB = 35;
    break;
  case 'p':
    setR = 198;
    setG = 35;
    setB = 245;
    break;
  case 't':
    setR = 26;
    setG = 194;
    setB = 211;
    break;
  case 'w':
    setR = 255;
    setG = 255;
    setB = 255;
    break;
  case 'k':
    setR = 0;
    setG = 0;
    setB = 0;
    break;
  }
}


