
RandomWalk [] walk;
int pic = 0;

void setup()
{
  size (675, 450);
  //smooth();
  PImage img = pic == 0 ? loadImage ("israel.jpg") : loadImage ("selbst.jpg");
  PImage bg = loadImage ("bg.jpg");

  walk = new RandomWalk [2];
  walk [0] = new RandomWalk (img, bg, (int) random (img.width), (int) random (img.height), false, 200, 0.3);
  walk [1] = new RandomWalk (img, bg, (int) random (img.width), (int) random (img.height), true, 100, 0.5);
}

void draw ()
{
  background (walk[0].getBackground());
  for (int i = 0; i < 80; i++) for (int j = 0; j < walk.length; j++) walk[j].move();
  for (int i = 0; i < walk.length; i++) walk[i].display();
}

class RandomWalk
{
  PImage sourceImg, displayImg, walkImg, bg;
  int x, y, width, height, a, emptyPix;
  boolean randomWalk;
  float completness;

  RandomWalk (PImage img, PImage bg, int x, int y, boolean randomWalk, int a, float completness)
  {
    this.sourceImg = img;
    this.bg = bg;
    this.x = x;
    this.y = y;
    this.randomWalk = randomWalk;
    this.a = a;
    this.completness = completness;
    init();
  }

  void init ()
  {
    sourceImg.loadPixels();
    walkImg = createImage (sourceImg.width, sourceImg.height, ARGB);
    displayImg = createImage (sourceImg.width, sourceImg.height, ARGB);
    walkImg.loadPixels();
    displayImg.loadPixels();
    for (int i = 0; i < displayImg.pixels.length; i++) walkImg.pixels [i] = color (255, 0);
    walkImg.updatePixels();
    arrayCopy (walkImg.pixels, displayImg.pixels);
    displayImg.updatePixels();
    emptyPix = displayImg.pixels.length-1;
    this.width = sourceImg.width;
    this.height = sourceImg.height;
  }

  void display ()
  {
    tint (255, a);
    image (displayImg, 0, 0);
  }

  void updateDisplayImage ()
  {
    color c = walkImg.pixels [y*walkImg.width+x];

    if (randomWalk && c != color (255, 0)) 
    {
      try 
      {
        randomMove();
      }
      catch (StackOverflowError t)
      {
        createNewPos (randomDir());
        //println ("StackOverflowError");
      }
    }
    else {
      walkImg.pixels [y*displayImg.width+x] = sourceImg.pixels [y*sourceImg.width+x];

      color blendC = blendColor (walkImg.pixels [y*displayImg.width+x], bg.pixels [y*displayImg.width+x], MULTIPLY);

      displayImg.pixels [y*displayImg.width+x] = blendC;
      walkImg.updatePixels();
      displayImg.updatePixels();
      if (c == color (255, 0)) emptyPix--;
    }
  }

  boolean checkValid (int x_, int X, int y_, int Y)
  {
    if (x_ < this.width && x_ >= 0 && y_ < this.height && y_ >= 0) 
    {
      if (y_ == Y && x_ == X) return false;
      else return true;
    }
    else return false;
  }

  PVector [] createPosArray (int X, int Y, int s)
  {
    ArrayList <PVector> alPV = new ArrayList();
    int x_ = X-s, y_ = Y-s;
    for (int i = 0; i < 9; i++)
    {
      if (checkValid (x_, X, y_, Y)) 
      {
        color c = walkImg.pixels [constrain (y_*walkImg.width+x_, 0, walkImg.pixels.length-1)];
        if (c == color (255, 0)) alPV.add (new PVector (x_, y_));
      } 

      x_++;
      if (x_ > X + s)
      {
        x_ = X-s;
        y_++;
      }
    }

    return PVectorArrayListToArray (alPV);
  }

  float getCompletness ()
  {
    return ((completness * 100.0 ) - (100.0 - (float) emptyPix / ((float) displayImg.pixels.length) * 100.0) );
  }

  PImage getBackground ()
  {
    return bg;
  }

  boolean getIsFinished ()
  {
    if ((completness * 100.0 ) - (100.0 - (float) emptyPix / ((float) displayImg.pixels.length) * 100.0) >= 0) return false;
    else return true;
  }

  PVector [] PVectorArrayListToArray (ArrayList alPV)
  {
    PVector [] aPV = new PVector [alPV.size()];
    for (int i = 0; i < aPV.length; i++)
    {
      aPV [i] = (PVector) alPV.get (i);
    }

    return aPV;
  }

  void move()
  {
    if ((completness * 100.0 ) - (100.0 - (float) emptyPix / ((float) displayImg.pixels.length) * 100.0) >= 0)
    {
      if (randomWalk)  randomMove();
      else interestingMove();
    }
  }

  void interestingMove ()
  {
    PVector [] neighbors = createPosArray (x, y, 1);

    int pos = 0, val = 0, dif = 0, dir = 0;

    for (int i = 0; i < neighbors.length; i++)
    {
      dir = (int) random (2);
      PVector [] feld = createPosArray ((int) neighbors[i].x, (int) neighbors[i].y, 1);
      val = difference ((int) neighbors[i].x, (int) neighbors[i].y, feld);

      if (dir == 0)
      {
        if (val >= dif) 
        {
          pos = i;
          dif = val;
        }
      }
      else
      {
        if (val > dif) 
        {
          pos = i;
          dif = val;
        }
      }
    }

    if (neighbors.length != 0)
    {
      if (dif < 5) 
      {
        createNewPos (getDirByPos((int) neighbors [pos].x, (int) neighbors[pos].y));
        updateDisplayImage();
        randomMove();
      }
      else {
        createNewPos (getDirByPos((int) neighbors [pos].x, (int) neighbors[pos].y));
        updateDisplayImage();
      }
    }
    else randomMove();
  }

  int getDirByPos (int X, int Y)
  {
    int dir = 0;
    if (X < x && Y < y) dir = 0;
    else if (X == x && Y < y) dir = 1;
    else if (X > x && Y < y) dir = 2; 
    else if (X < x && Y == y) dir = 3;  
    else if (X > x && Y == y) dir = 4; 
    else if (X < x && Y > y) dir = 5; 
    else if (X == x && Y > y) dir = 6; 
    else if (X > x && Y > y) dir = 7; 
    return dir;
  }

  int difference (int X, int Y, PVector [] feld)
  {
    int dif = 0;
    int r = (int) red (sourceImg.pixels [Y*sourceImg.width+X]);
    int g = (int) green (sourceImg.pixels [Y*sourceImg.width+X]);
    int b = (int) blue (sourceImg.pixels [Y*sourceImg.width+X]);

    int x_ = X, y_ = Y, r_ = 0, g_ = 0, b_ = 0;

    for (int i = 0; i < feld.length; i++)
    {
      x_ = (int) feld [i].x;
      y_ = (int) feld [i].y;

      r_ = (int) red (sourceImg.pixels [y_*sourceImg.width+x_]);
      g_ = (int) green (sourceImg.pixels [y_*sourceImg.width+x_]);
      b_ = (int) blue (sourceImg.pixels [y_*sourceImg.width+x_]);

      dif += abs (r-r_) + abs (g-g_) + abs (b-b_);
    }

    dif = (int) ((float) dif / (float) feld.length);
    return dif;
  }

  void randomMove ()
  {
    createNewPos (randomDir());
    updateDisplayImage();
  }

  void createNewPos (int dir)
  {
    switch (dir)
    {
    case 0:
      x--;
      y--;
      break;
    case 1:
      y--;
      break;
    case 2: 
      x++;
      y--;
      break;
    case 3: 
      x--;
      break;
    case 4:
      x++;
      break;
    case 5:
      x--;
      y++;
      break;
    case 6:
      y++;
      break;
    case 7:
      x++;
      y++;
      break;
    default:
      //do nothing
      break;
    }

    x = constrain (x, 0, sourceImg.width-1);
    y = constrain (y, 0, sourceImg.height-1);
  }

  int randomDir ()
  {
    return (int) random (8);
  }
}

void mousePressed ()
{
  setup();
}


void keyPressed ()
{
  if (keyCode == KeyEvent.VK_1) 
  {
    pic = 0;
    setup();
  }
  if (keyCode == KeyEvent.VK_2)
  {
    pic = 1;
    setup();
  }
}


