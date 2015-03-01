
int num= 200;
float [] locX = new float[num];
float [] locY = new float[num];
float [] dirX = new float[num];
float [] dirY = new float[num];
float [] s = new float [num];


void setup ()
{
  size(600, 600);
  smooth();

  frameRate (30);

  initVariables();
}

void draw ()
{
  //  background (255);

  fill (#57385c, 50);
  noStroke();
  rect (0, 0, width, height);

  stroke (#A75265, 120);
  fill (#ffedbc);
  int i = 0;
  while (i < s.length)
  {
    moveBall(i, s [i]);
    checkEdges (i);
    drawBall( locX [i], locY[i]);
    i = i + 1;
  }
}

void checkEdges (int i)
{
  if (locX[i] < 0)
  {
    locX[i] = 0;
    dirX[i] = dirX[i] * -1;
  }
  if (locX[i] > width)
  {
    locX[i] = width;
    dirX[i] = dirX[i] * -1;
  }

  if (locY[i] < 0)
  {
    locY[i] = 0;
    dirY[i] = dirY[i] * -1;
  }
  if (locY[i] > height)
  {
    locY[i] = height;
    dirY[i] = dirY[i] * -1;
  }
}

void moveBall (int i, float speed)
{
  float veloCityX = dirX [i];
  float veloCityY = dirY [i];
  
  veloCityX = veloCityX *speed;
  veloCityY = veloCityY *speed;

  locX[i] = locX[i]+veloCityX ;
  locY[i] = locY[i]+veloCityY ;
}

void drawBall (float x, float y)
{
  ellipse (x, y, 6, 6);
}

void initVariables ()
{
  int i = 0;
  while (i < s.length) 
  {
    locX [i] = width/2;
    locY [i] = height/2;

    float angle = random (TWO_PI);
    float speed = random (3, 6);

    dirX [i] = cos (angle);
    dirY [i] = sin (angle);
    s[i] = speed;

    i = i + 1;
  }
}

void mousePressed ()
{
  initVariables ();
}

// init
// zeichnen
// move
// kantenüberprüfung

