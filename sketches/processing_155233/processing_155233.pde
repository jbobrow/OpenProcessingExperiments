
PVector [] start;
PVector [] end;

float m = 0;

void setup() {
  size(600, 200);
  smooth();

  start = new PVector [50];
  end = new PVector [50];

  setRandomPositions (start);
  setRandomPositions (end);

  frameRate (30);
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
  rect (0,0,width, height);

  fill (#ffffff);
  noStroke();

  int i = 0;
  while (i < start.length)
  {

    PVector current = new PVector (lerp (start[i].x, end[i].x, sin (m)), lerp (start[i].y, end[i].y, sin (m)));



    ellipse (current.x, current.y, 6, 6);
    i = i+1;
  }

  m+= 0.02;

  if (m >= PI/2)
  {
    m = 0;
    arrayCopy (end, start);
    setRandomPositions (end);
  }
}

