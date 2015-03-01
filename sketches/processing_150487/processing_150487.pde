
int num = 50;


float [] ellipseSize;
float [] x;
float [] y;

float [] velocityX;
float [] velocityY;

void setup ()
{
  size (600, 200);
  smooth();

  initArrays();
  initValues ();
  
  frameRate (30);

  background (#57385c);
}

void draw ()
{
  background (#57385c);

drawConnections();
  displayEllipse ();
  moveEllipse ();
  checkEdges ();
}

void checkEdges ()
{
  int i = 0;
  while (i < num)
  {

    if (x [i] < ellipseSize [i] / 2) 
    {
      x [i] = ellipseSize [i] / 2;
      velocityX [i] = velocityX [i] * -1;
    }
    else if (x [i] > width- ellipseSize [i] / 2) 
    {
      x [i] = width- ellipseSize [i] / 2;
      velocityX [i] = velocityX [i] * -1;
    }

    if (y [i] < ellipseSize [i] / 2) 
    {
      y [i] = ellipseSize [i] / 2;
      velocityY [i] = velocityY [i] * -1;
    }
    else if (y [i] > height- ellipseSize [i] / 2) 
    {
      y [i] = height- ellipseSize [i] / 2;
      velocityY [i] = velocityY [i]* -1;
    }

    i = i + 1;
  }
}

void initArrays ()
{
  ellipseSize = new float [num];

  x = new float [num];
  y = new float [num];

  velocityX = new float [num];
  velocityY = new float [num];
}

void initValues ()
{
  int i = 0;
  while (i < num)
  {

    ellipseSize [i] = random (5, 20);

    x [i] = random (width);
    y [i] = random (height);

    velocityX [i] = random (-2, 2);
    velocityY [i] = random (-2, 2);
    i = i +1;
  }
}

void moveEllipse ()
{
  int i = 0;
  while (i < num)
  {
    x [i] = x [i] + velocityX [i];  
    y [i] = y [i] + velocityY [i];

    i = i +1;
  }
}

void drawConnections ()
{
  stroke (#ffedbc, 120);
  int i = 0;
  while (i < num)
  {
    float x1 = x [i];
    float y1 = y [i];

    int j = 0;

    while (j < num)
    {
      float x2 = x [j];
      float y2 = y [j];

      float distance = dist (x1, y1, x2, y2);

      if (distance > 30 && distance < 60)
      {
        line (x1, y1, x2, y2);
      }

      j = j + 1;
    }

    i = i + 1;
  }
}

void displayEllipse ()
{

  int i = 0;
  while (i < num)
  {
    float colorValue = map (ellipseSize [i], 5, 20, 0, 1);
    color c = lerpColor (#ffedbc, #57385c, colorValue);
    color strokeColor = lerpColor (#ffedbc, #57385c, 1-colorValue);

    fill (c);
    stroke (strokeColor);

    ellipse (x [i], y [i], ellipseSize [i], ellipseSize [i]);

    i = i +1;
  }
}

void mousePressed ()
{
  initValues ();
}

