
float ellipseSize = 30;
float x = 300;
float y = 100;

float velocityX = 1;
float velocityY = 1;

void setup ()
{
  size (600, 200);
  smooth();

  initValues ();

  background (#57385c);
  noLoop();
}

void draw ()
{
  background (#57385c);
  
  int numberOfRepetition = (int) random (1000, 30000);
  int i = 0;
  
  while (i < numberOfRepetition ) {

      moveEllipse ();
      checkEdges ();
      displayEllipse ();
      i = i + 1;
  }
}

void checkEdges ()
{
  if (x < ellipseSize / 2) 
  {
    x = ellipseSize / 2;
    velocityX = velocityX * -1;
  }
  else if (x > width- ellipseSize / 2) 
  {
    x = width- ellipseSize / 2;
    velocityX = velocityX * -1;
  }
  
  if (y < ellipseSize / 2) 
  {
    y = ellipseSize / 2;
    velocityY = velocityY * -1;
  }
  else if (y > height- ellipseSize / 2) 
  {
    y = height- ellipseSize / 2;
    velocityY = velocityY* -1;
  }
}

void initValues ()
{

  ellipseSize = random (5, 20);

  x = random (width);
  y = random (height);

  velocityX = random (-4, 4);
  velocityY = random (-4, 4);
}

void moveEllipse ()
{
  x = x+velocityX;
  y = y+velocityY;
}

void displayEllipse ()
{

  fill (#ffedbc, 120);
  stroke (#A75265);

  ellipse (x, y, ellipseSize, ellipseSize);
}

void mousePressed ()
{
  initValues ();
  redraw();
}

