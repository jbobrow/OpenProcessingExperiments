
PImage img;

PVector [] start;
PVector [] end;

float m = 0;

boolean bBlur = true;
boolean bCopy = true;


void setup() {
  size(600, 200, P3D);
  // smooth();

  img = loadImage ("op.jpg");

  start = new PVector [2000];
  end = new PVector [2000];

  setRandomPositions (start);
  arrayCopy (start, end);
  setNearestRandomPositions (end, end.length);

  frameRate (30);
}

void setNearestRandomPositions (PVector [] p, int num)
{

  PVector [] randomPos = new PVector [num];

  int k = 0;
  while (k < num)
  {
    PVector pos = new PVector (random (width), random (height));
    if (isTarget(pos))
    {
      randomPos [k] = pos;
      k = k +1;
    }
  }

  int nearestIndex = 0;
  float nearestDistance = width*height;

  for (int i = 0; i < p.length; i++)
  {
    nearestIndex = 0;
    nearestDistance = width*height;

    for (int j = 0; j < randomPos.length; j++)
    {
      if (randomPos[j].z == -1) continue;

      float distance = dist (randomPos[j].x, randomPos[j].y, p[i].x, p[i].y);
      if (distance < nearestDistance)
      {
        nearestDistance = distance;
        nearestIndex = j;
      }
    }

    p [i] = randomPos[nearestIndex].get();
    randomPos[nearestIndex].z = -1;
  }
}

void setRandomPositions (PVector [] p)
{

  int i = 0;
  while (i < p.length)
  {
    PVector pos = new PVector (random (width), random (height));
    p [i] = pos;
    i = i +1;
  }
}

boolean isTarget (PVector p)
{
  int index = (int) p.y * img.width + (int) p.x;
  index = constrain (index, 0, img.pixels.length-1);

  float helligkeit = brightness (img.pixels [index]);
  if (helligkeit > 240) return false;
  else if (helligkeit < 10) return true;
  else
  {
    float rVal = random (0, helligkeit);
    if (rVal < 1) return true;
    else return false;
  }
}


void draw()
{
  fill (#57385c, 40);
  noStroke();
  rect (0, 0, width, height);

  if (bBlur) blur(2);

  // zoom

  if (mousePressed)
  {
    translate (-mouseX*3, -mouseY*3);
    scale (3);
  }

  // draw ellipses

  stroke (#ffffff);

  int i = 0;
  while (i < start.length)
  {

    PVector current = new PVector (lerp (start[i].x, end[i].x, sin (m)), lerp (start[i].y, end[i].y, sin (m)));

    point (current.x, current.y);
    i = i+1;
  }

  if (bCopy) copy (0, 0, width, height, 0, 0, width+1, height+1);

  // move

  m+= 0.02;

  // check if target reached and set new target

  if (m >= PI/2)
  {
    m = 0;
    arrayCopy (end, start);
    setNearestRandomPositions (end, (int) (end.length*1.1));
  }
}

void keyPressed ()
{
  if (key == ' ')
  {
    m = 0;
    arrayCopy (end, start);
    setRandomPositions (end);
  }
  if (key == '1') bCopy = !bCopy;
  if (key == '2') bBlur = !bBlur;
  if (key == 's') saveFrame ("export/#####.png");
}


// Martin Schneider
// October 14th, 2009
// k2g2.org


void blur(int dd) {
  loadPixels();
  int[] px = new int[pixels.length];
  for (int d=1<<--dd; d>0; d>>=1) {
    for (int x=0;x<width;x++) for (int y=0;y<height;y++) {
      int p = y*width + x;
      int e = x >= width-d ? 0 : d;
      int w = x >= d ? -d : 0;
      int n = y >= d ? -width*d : 0;
      int s = y >= (height-d) ? 0 : width*d;
      int r = ( r(pixels[p+w]) + r(pixels[p+e]) + r(pixels[p+n]) + r(pixels[p+s]) ) >> 2;
      int g = ( g(pixels[p+w]) + g(pixels[p+e]) + g(pixels[p+n]) + g(pixels[p+s]) ) >> 2;
      int b = ( b(pixels[p+w]) + b(pixels[p+e]) + b(pixels[p+n]) + b(pixels[p+s]) ) >> 2;
      px[p] = 0xff000000 + (r<<16) | (g<<8) | b;
    }
    arrayCopy(px, pixels);
  }
}


int r(color c) {
  return (c >> 16) & 255;
}
int g(color c) {
  return (c >> 8) & 255;
}
int b(color c) {
  return c & 255;
}


