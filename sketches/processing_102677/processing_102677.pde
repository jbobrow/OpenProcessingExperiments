
// copyright by Diana Lange 2013
// www.diana-lange.de
// https://www.facebook.com/pages/Diana-Lange/174658116017

// More than just inspired by Vera Molnar. Hommage à Dürer – 400 aiguilles, traversées par un fil. 

int squareNum = 5, squareRes = 4, padd = 30;
SquareManager sm;

void setup ()
{
  size (600, 600);
  smooth();
  sm = new SquareManager(squareNum, squareNum, squareRes, squareRes, padd);
}

void draw ()
{
  background (6,17,28);

  noFill();
  stroke (255, 200);
  beginShape();
  sm.draw();
  endShape();
}

class SquareManager
{
  float [] startX, startY;
  float paddX, paddY;
  Squared [] s;

  SquareManager(int XRES, int YRES, int xres, int yres, int padd)
  {
    init(XRES, YRES, xres, yres, padd);
  }

  void update ()
  {
    for (int i = 0; i < s.length; i++)
    {
      s[i].init (s[i].w, s [i].h);
    }
  }
  
  void updatePadding (int PADD)
  {
    float wSquare = (float) (width-(startX.length+1)*PADD) / (float) startX.length;
    float ySquare = (float) (height-(startY.length+1)*PADD) / (float) startY.length;

    paddX = wSquare / (float) (s[0].w-1);
    paddY = ySquare / (float) (s[0].h-1);

    float x = PADD, y = x;
    for (int i = 0; i < startX.length; i++)
    {
      startX [i] = x;
      x+=  wSquare + PADD;
    }

    for (int i = 0; i < startY.length; i++)
    {
      startY [i] = y;
      y+= ySquare + PADD;
    }
  }

  void updateSquareRes (int xres, int yres, int PADD)
  {
    for (int i = 0; i < s.length; i++) s[i] = new Squared (xres, yres);

    float wSquare = (float) (width-(startX.length+1)*PADD) / (float) startX.length;
    float ySquare = (float) (height-(startY.length+1)*PADD) / (float) startY.length;

    paddX = wSquare / (float) (xres-1);
    paddY = ySquare / (float) (yres-1);

    float x = PADD, y = x;
    for (int i = 0; i < startX.length; i++)
    {
      startX [i] = x;
      x+=  wSquare + PADD;
    }

    for (int i = 0; i < startY.length; i++)
    {
      startY [i] = y;
      y+= ySquare + PADD;
    }
  }

  void init (int XRES, int YRES, int xres, int yres, int PADD)
  {
    s = new Squared [XRES*YRES];
    for (int i = 0; i < s.length; i++) s[i] = new Squared (xres, yres);

    startX = new float [XRES];
    startY = new float [YRES];

    float wSquare = (float) (width-(XRES+1)*PADD) / (float) XRES;
    float ySquare = (float) (height-(YRES+1)*PADD) / (float) YRES;

    paddX = wSquare / (float) (xres-1);
    paddY = ySquare / (float) (yres-1);

    float x = PADD, y = x;
    for (int i = 0; i < XRES; i++)
    {
      startX [i] = x;
      x+=  wSquare + PADD;
    }

    for (int i = 0; i < YRES; i++)
    {
      startY [i] = y;
      y+= ySquare + PADD;
    }
  }

  void draw ()
  {
    float x;
    beginShape ();
    for (int i = 0; i < s.length; i++)
    {

      if ((i / startX.length) % 2 == 0)  x = startX [i % startX.length];
      else x = startX [startX.length-1 - (i % startX.length)];

      s[i].drawVertex (x, startY[i / startX.length], paddX, paddY);
    }
    endShape();
  }
}

class Squared 
{
  int w, h;
  int [] index;
  Squared (int xres, int yres)
  {
    w = xres;
    h = yres;
    init(xres, yres);
  }


  void init (int xres, int yres)
  {
    index = new int [xres*yres];
    ArrayList <Integer> indexInARow = new ArrayList();
    for (int i = 0; i < index.length; i++) indexInARow.add (i);

    int randomIndex;
    for (int i = 0; i < index.length; i++)
    {
      randomIndex = (int) random (indexInARow.size());
      index [i] = indexInARow.get(randomIndex);
      indexInARow.remove (randomIndex);
    }
  }

  void drawVertex (float X, float Y, float PADDX, float PADDY)
  {
    float x, y;
    for (int i = 0; i < index.length; i++)
    {
      x = X + PADDX * (index [i] % w);
      y = Y + PADDY * (index [i] / w);
      vertex (x, y);
    }
  }
}

void mousePressed ()
{
  sm.update();
}

void keyPressed ()
{
  if (key == 'n')
  {
    squareNum--;
    if (squareNum < 1) squareNum = 1;
    sm = new SquareManager (squareNum, squareNum, squareRes, squareRes, padd);
  }

  if (key == 'm')
  {
    squareNum++;
    sm = new SquareManager (squareNum, squareNum, squareRes, squareRes, padd);
  }
  if (key == 'v')
  {
    squareRes--;
    if (squareRes < 2) squareRes = 2;
    sm.updateSquareRes (squareRes, squareRes, padd);
  }
  if (key == 'b')
  {
    squareRes++;
    sm.updateSquareRes (squareRes, squareRes, padd);
  }
  
  if (key == 'x')
  {
    padd--;
    if (padd < 0) padd = 0;
    sm.updatePadding (padd);
  }
  if (key == 'c')
  {
    padd++;
    sm.updatePadding (padd);
  }
}


