
PImage img;

PVector [] pos;

float m = 0;


void setup() {
  size(600, 200);
  smooth();

  img = loadImage ("op.jpg");

  pos = new PVector [2000];

  setImagePositions (pos);

  frameRate (30);
}

void setImagePositions (PVector [] p)
{

  int i = 0;
  while (i < p.length)
  {
    PVector pos = new PVector (random (width), random (height));

    if (isTarget(pos))
    {
      p [i] = pos;
      i = i +1;
    }
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
    setImagePositions (pos);
  }
  else saveFrame ("export/img_####.png");
}


