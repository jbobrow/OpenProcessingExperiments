
PVector [] start;
PVector [] end;

float m = 0;

void setup() {
  size(600, 200);
  smooth();

  start = new PVector [50];
  end = new PVector [50];

  setRandomPositions (start);
  arrayCopy (start, end);
    setNearestRandomPositions (end, int (end.length*1.5));

  frameRate (30);
}

void setNearestRandomPositions (PVector [] p, int num)
{
  
  PVector [] randomPos = new PVector [num];

  for (int i = 0; i < randomPos.length; i++)
  {
    PVector pos = new PVector (random (width), random (height));
    randomPos [i] = pos;
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


void draw()
{
  fill (#57385c, 80);
  noStroke();
  rect (0, 0, width, height);

  // draw ellipses

  fill (#ffffff);
  noStroke();

  int i = 0;
  while (i < start.length)
  {

    PVector current = new PVector (lerp (start[i].x, end[i].x, sin (m)), lerp (start[i].y, end[i].y, sin (m)));

    ellipse (current.x, current.y, 6, 6);
    i = i+1;
  }

  // move

  m+= 0.02;

  // check if target reached and set new target

  if (m >= PI/2)
  {
    m = 0;
    arrayCopy (end, start);
    setNearestRandomPositions (end, int (end.length*1.5));
  }
}

