
PImage img;

PVector [] start;
PVector [] end;

float m = 0;


void setup() {
  size(600, 200);
  smooth();

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
  fill (#57385c, 80);
  noStroke();
  rect (0, 0, width, height);

  // zoom

  if (mousePressed)
  {
    translate (-mouseX*3, -mouseY*3);
    scale (3);
  }

  // draw ellipses

  fill (#ffffff, 180);
  noStroke();

  int i = 0;
  while (i < start.length)
  {

    PVector current = new PVector (lerp (start[i].x, end[i].x, sin (m)), lerp (start[i].y, end[i].y, sin (m)));

    ellipse (current.x, current.y, 1.5, 1.5);
    i = i+1;
  }

  // move

  m+= 0.02;

  // check if target reached and set new target

  if (m >= PI/2)
  {
    m = 0;
    arrayCopy (end, start);
    setNearestRandomPositions (end, end.length);
  }
}

void keyPressed ()
{
  m = 0;
  arrayCopy (end, start);
  setRandomPositions (end);
}


