
/*----------------------------------
     
 Copyright by Diana Lange 2014
 Don't use without any permission
   
 This sketch is based on:
 #506 Stroll in the park
 http://geometrydaily.tumblr.com/post/58241545792/506-stroll-in-the-park
     
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/
 
ArrayList <PVector> dots;
ArrayList <DianaTriangle> tt;
ArrayList <PVector> ids;

float ellipseFactor = 1.5;
int margin;
int RES = 15;
int W;
float zoom = 1;
int randomSeedNum = (int) random (10000);

void setup ()
{
  size (700, 700);
  smooth();

  strokeJoin (ROUND);
  margin = width /10;
  W = width;

  initSetup ();

  ellipseMode (CORNER);
}

void draw ()
{
  background (237);

  scale (zoom, 1);
  drawDelaunay();

  scale (1, 1);
  drawEllipsen();
  //drawDots();
}

void drawEllipsen ()
{
  randomSeed (randomSeedNum);
  int eResRow = (int) (RES*ellipseFactor); 

  fill (#065239, 180);
  float d = (float) (height-2*margin) / (eResRow);
  int eResColumn = (int) ((float) (height-2*margin) / (d*0.85));
  int dice = 0;

  float x, y;

  for (int i = 0; i < eResColumn-1; i++)
  {
    x = i*d*0.85+margin+d/2;
    for (int j = 0; j < ((i % 2 == 0) ? eResRow : eResRow-1); j++)
    {
      y = (i % 2 == 0) ? margin+j*d : margin+j*d+d/2;

      dice = (int) random (6);
      if (dice > 2 && y+d < height-margin && x+d < width-margin) ellipse (x, y, d, d);
    }
  }
}

void initSetup ()
{
  randomSeed (millis() + second ());
  int tw = (int) (width-2.0*margin) / RES;
  int th = (int) (height-2.0*margin) / RES;
  dots = createDots (tw, th, width, height, margin);

  zoom = (float) (width-2*margin) / (float) W;

  createTriangles(width, height);

  removeTriangles ((int) random (tt.size()/3, tt.size()/2));
}

void removeTriangles (int amount)
{
  int i = 0;
  int index;
  while (i < amount)
  {
    index = (int) random (tt.size());

    tt.remove (index);
    i++;
  }
}

void drawDots ()
{
  stroke (1);
  for (int i = 0; i < dots.size(); i++)
  {
    point (dots.get(i).x, dots.get(i).y);
  }
}

void drawDelaunay ()
{
  strokeWeight (1.5);
  beginShape(TRIANGLES);
  for (int i = 0; i < tt.size(); i++)
  {
    tt.get (i).drawVertex(0);
  }

  endShape();
}

class DianaTriangle
{
  PVector [] t;
  color c, cc;

  DianaTriangle (PVector p1, PVector p2, PVector p3)
  {
    c = color(random (0, 120));
    cc = c;
    initVectors (p1, p2, p3);
  }

  void initVectors (PVector p1, PVector p2, PVector p3)
  {
    t = new PVector [4];
    for (int i = 0; i < t.length; i++) t [i] = new PVector (0, 0);
    t [0].x = p1.x;
    t [0].y = p1.y;
    t [0].z = 0;

    t [1].x = p2.x;
    t [1].y = p2.y;
    t [1].z = 0;

    t [2].x = p3.x;
    t [2].y = p3.y;
    t [2].z = 0;

    t [3].x = t[getLeft()].x + (abs (t[getRight()].x - t[getLeft()].x)*0.5);
    t [3].y = t[getTop()].y + (abs(t[getBottom()].y - t[getTop()].y)*0.5);
    t [3].z = 0;
  }

  private int getLeft ()
  {
    if (t[0].x <= t[1].x && t[0].x <= t[2].x) return 0;
    if (t[1].x <= t[0].x && t[1].x <= t[2].x) return 1;
    if (t[2].x <= t[0].x && t[2].x <= t[1].x) return 2;
    return 0;
  }

  private int getRight ()
  {
    if (t[0].x >= t[1].x && t[0].x >= t[2].x) return 0;
    if (t[1].x >= t[0].x && t[1].x >= t[2].x) return 1;
    if (t[2].x >= t[0].x && t[2].x >= t[1].x) return 2;
    return 0;
  }

  private int getTop ()
  {
    if (t[0].y <= t[1].y && t[0].y <= t[2].y) return 0;
    if (t[1].y <= t[0].y && t[1].y <= t[2].y) return 1;
    if (t[2].y <= t[0].y && t[2].y <= t[1].y) return 2;
    return 0;
  }

  private int getBottom ()
  {
    if (t[0].y >= t[1].y && t[0].y >= t[2].y) return 0;
    if (t[1].y >= t[0].y && t[1].y >= t[2].y) return 1;
    if (t[2].y >= t[0].y && t[2].y >= t[1].y) return 2;
    return 0;
  }

  void setColor (color c)
  {
    this.c = c;
    cc = c;
  }

  void setColor ()
  {
    c = cc;
  }

  void lerpTheColor (color c)
  {
    colorMode (HSB);
    this.c = color (hue (c), saturation (c), brightness (cc));
    colorMode (RGB);
  }

  PVector getCendoid ()
  {
    return t[3];
  }


  boolean checkLimit (float minX, float maxX, float minY, float maxY)
  {
    for (int i = 0; i < t.length; i++)
    {

      if (t[i].x < minX) return true;
      if (t[i].x > maxX) return true;

      if (t[i].y < minY) return true;
      if (t[i].y > maxY) return true;
    }
    return false;
  }

  void doLimit (float minX, float maxX, float minY, float maxY)
  {
    for (int i = 0; i < t.length; i++)
    {

      if (t[i].x < minX) t[i].x = minX;
      if (t[i].x > maxX) t[i].x = maxX;

      if (t[i].y < minY) t[i].y = minY;
      if (t[i].y > maxY) t[i].y = maxY;
    }
  }

  void drawVertex (int MODE)
  {

    if (MODE == 0)
    {
      noStroke ();
      fill (c);
    }
    else
    {
      noFill();
      stroke (c);
    }
    for (int i = 0; i < t.length-1; i++)
    {
      vertex (t[i].x, t[i].y);
    }
  }
}

void createTriangles (int w, int h)
{

  tt = new ArrayList();
  int i, j, index, index2;
  PVector p1, p2, p3;

  for (int k= 0; k < dots.size(); k++)
  {
    i = (int) ids.get(k).y;
    j = (int) ids.get(k).x;


    if (i % 2 == 0) // even rows
    {
      /* first triangle ----------------------------------------------------------------*/

      p1 = new PVector (dots.get(k).x, dots.get(k).y);
      index = findIndex (ids, k, j+1, i+1);
      if (index == -1) continue;
      p2 = new PVector (dots.get(index).x, dots.get(index).y);
      index2 = findIndex (ids, k, j, i+1);
      if (index2 == -1) continue;
      p3 = new PVector (dots.get(index2).x, dots.get(index2).y);

      tt.add (new DianaTriangle (p1, p2, p3));          // create triangle

      /* second triangle ----------------------------------------------------------------*/

      p1 = new PVector (dots.get(k).x, dots.get(k).y);
      index = findIndex (ids, k, j+1, i);
      if (index == -1) continue;
      p2 = new PVector (dots.get(index).x, dots.get(index).y);
      index = findIndex (ids, k, j+1, i+1);
      if (index == -1) continue;
      p3 = new PVector (dots.get(index).x, dots.get(index).y);
      tt.add (new DianaTriangle (p1, p2, p3));         // create triangle
    }
    else // odd rows
    {
      /* first triangle ----------------------------------------------------------------*/

      p1 = new PVector (dots.get(k).x, dots.get(k).y);
      index = findIndex (ids, k, j, i+1);
      if (index == -1) continue;
      p2 = new PVector (dots.get(index).x, dots.get(index).y);
      index2 = findIndex (ids, k, j+1, i);
      if (index2 == -1) continue;
      p3 = new PVector (dots.get(index2).x, dots.get(index2).y);

      tt.add (new DianaTriangle (p1, p2, p3));          // create triangle

      /* second triangle ----------------------------------------------------------------*/

      p1 = new PVector (dots.get(k).x, dots.get(k).y);
      index = findIndex (ids, k-1, j-1, i+1);
      if (index == -1) continue;
      p2 = new PVector (dots.get(index).x, dots.get(index).y);
      index2 = findIndex (ids, k, j, i+1);
      if (index2 == -1) continue;
      p3 = new PVector (dots.get(index2).x, dots.get(index2).y);

      tt.add (new DianaTriangle (p1, p2, p3));
    }
  }

  /* colorize triangles ---------------------------------------------------*/

  int count = 0;
  while (count < tt.size ())
  {
    p1 = tt.get (count).getCendoid();
    tt.get (count).setColor(#6295B4);
    count++;
  }
}


int findIndex (ArrayList <PVector> rev, int startIndex, float lookupX, float lookupY)
{
  PVector p;
  for (int i = startIndex; i < rev.size(); i++)
  {
    p = rev.get(i);
    if (p.y == lookupY && p.x == lookupX) return i;
  }
  return -1;
}


ArrayList <PVector> createDots (int triangleWidth, int triangleHeight, int w, int h, int m)
{
  ArrayList <PVector> dots = new ArrayList();
  ids = new ArrayList();

  int x = m, y = 0;
  int idX = 0, idY = 0;
  int padd = triangleWidth;
  println (padd);

  for (int i = 0; i <= RES; i++)
  {
    idX = 0;
    for (int j = 0; j < w-2*m; j+=triangleWidth)
    {
      x = (i  % 2 == 1)  ? j : j + triangleWidth/2;
      y = i * triangleHeight;

      if (x < w)
      {
        dots.add (new PVector (x+m, y+m));
        ids.add (new PVector (idX, idY));
      }

      idX++;
    }
    W = x;
    idY++;
  }

  return dots;
}

void mouseDragged ()
{
  ellipseFactor = map (mouseX, 0, width, 0.05, 15);
}

void keyPressed ()
{
  if (key == ' ')
  {
    randomSeedNum++;
    initSetup();
  }
  
   if (key == 't') initSetup();
   if (key == 'e') randomSeedNum++;
   
   if (key == '+') 
   {
     RES++;
     initSetup();
   }
   if (key == '-') 
   {
     RES--;
     if (RES < 6) RES = 6;
     initSetup();
   }
   
   if (key == 'b') {
    margin+=2;  
    if (margin > width/3) margin = width/3;
    initSetup();
  }
  if (key == 'v')
  {
    margin--;
    if (margin < 0) margin = 0;
    initSetup();
  }
}

