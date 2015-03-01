
PVector [] pos;

float m = 0;


void setup() {
  size(600, 200);
  smooth();


  pos = new PVector [2000];

  setRadialPositions (pos);

  frameRate (30);
}

void setRadialPositions (PVector [] p)
{

  int i = 0;
  while (i < p.length)
  {
    PVector pos = new PVector (random (width), random (height));

    if (isTarget(pos, width/2, height/2, 100))
    {
      p [i] = pos;
      i = i +1;
    }
  }
}

boolean isTarget (PVector p, float cx, float cy, float rad)
{
  float distance = dist (p.x, p.y, cx, cy);
  
  if (distance > rad) return false;
  else
  {
    float value = map (distance, 0, rad, 100, 0);
    float rVal = random (0, value);
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
  while (i < pos.length)
  {

    PVector p = pos [i].get();

    ellipse (p.x, p.y, 1.5, 1.5);
    i = i+1;
  }


}

void keyPressed ()
{
  if (key == ' ')
  {
    setRadialPositions (pos);
  }
  else saveFrame ("export/img_####.png");
}

