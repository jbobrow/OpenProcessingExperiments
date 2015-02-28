
/*---------------------------
-----------------------------------*/
 
 
PImage I;
ArrayList <PVector> dots;
ArrayList <DianaTriangle> tt;
ArrayList <PVector> ids;
int W, H, displayMode = 0;
float zoom = 1.0;
 
/* @pjs preload="naty.jpg"; */
 
void setup ()
{
  I=loadImage("naty.jpg");
 
  size (800, 533);
  smooth();
 
  strokeJoin (ROUND);
  initSetup (30);
}
 
void draw ()
{
  background (255);
  scale (zoom);
  drawDelaunay();
}
 
void initSetup (int RES)
{
  dots = createDots (RES, I.width, I.height);
 
  createTriangles(I.pixels, I.width, I.height);
 
  int whiteX = width - W, whiteY = height - H;
  if (whiteX > whiteY) zoom = (float) width / (float) W;
  else zoom = (float) height / (float) H;
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
    tt.get (i).drawVertex(displayMode);
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
 
void keyPressed ()
{
    if (key == 'd')
    {
      displayMode++;
      if (displayMode > 1) displayMode = 0;
    }
     
    if (key == '1') initSetup (150);
    if (key == '2') initSetup (125);
    if (key == '3') initSetup (100);
    if (key == '4') initSetup (80);
    if (key == '5') initSetup (60);
    if (key == '6') initSetup (40);
    if (key == '7') initSetup (30);
    if (key == '8') initSetup (20);
    if (key == '9') initSetup (10);
}
 
 
void createTriangles (int [] c, int w, int h)
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
      index = findIndex (ids, k, j, i+1);
      if (index == -1) continue;
      p2 = new PVector (dots.get(index).x, dots.get(index).y);
      index2 = findIndex (ids, k, j+1, i);
      if (index2 == -1) continue;
      p3 = new PVector (dots.get(index2).x, dots.get(index2).y);
 
      if (j == 0)                                       // first triangle in each row
      {
        tt.add (new DianaTriangle (p1, new PVector (0, p2.y), p2));
      }
      tt.add (new DianaTriangle (p1, p2, p3));          // create triangle
 
      if (p3.x == W)                                   // last triangle in each row
      {
        tt.add (new DianaTriangle (p3, p2, new PVector (W, p2.y)));
      }
 
 
 
      /* second triangle ----------------------------------------------------------------*/
 
      p1 = new PVector (dots.get(k).x, dots.get(k).y);
      index = findIndex (ids, k, j-1, i+1);
      if (index == -1) continue;
      p2 = new PVector (dots.get(index).x, dots.get(index).y);
      index = findIndex (ids, k, j, i+1);
      if (index == -1) continue;
      p3 = new PVector (dots.get(index).x, dots.get(index).y);
      tt.add (new DianaTriangle (p1, p2, p3));         // create triangle
    }
    else // even rows
    {
      /* first triangle ----------------------------------------------------------------*/
 
      p1 = new PVector (dots.get(k).x, dots.get(k).y);
      index = findIndex (ids, k, j, i+1);
      if (index == -1) continue;
      p2 = new PVector (dots.get(index).x, dots.get(index).y);
      index2 = findIndex (ids, k, j+1, i+1);
      if (index2 == -1) continue;
      p3 = new PVector (dots.get(index2).x, dots.get(index2).y);
 
      if (j == 0)                                      // first triangle in each row
      {
        tt.add (new DianaTriangle (p1, new PVector (0, p1.y), new PVector (0, p2.y) ));
      }   
      tt.add (new DianaTriangle (p1, p2, p3));          // create triangle
 
      if (p3.x == W)                                   // last triangle in each row
      {
        tt.add (new DianaTriangle (p1, p3, new PVector (W, p1.y)  ));
      }
 
 
 
      /* second triangle ----------------------------------------------------------------*/
 
      p1 = new PVector (dots.get(k).x, dots.get(k).y);
      index = findIndex (ids, k-1, j-1, i);
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
    tt.get (count).setColor(c [(int) p1.y*w + (int) p1.x]);
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
 
 
ArrayList <PVector> createDots (int padd, int w, int h)
{
  ArrayList <PVector> dots = new ArrayList();
  ids = new ArrayList();
 
  int x = 0, idX = 0, idY = 0;
  int index = 0;
 
  for (int i = 0; i < h; i+=padd)
  {
    idX = 0;
    for (int j = 0; j < w; j+=padd)
    {
      x = ((i / padd) % 2 == 0) ? j : j + padd/2;
 
      index = i*w+x;
      if (x < w)
      {
        dots.add (new PVector (x, i));
        ids.add (new PVector (idX, idY));
      }
      W = j;
      idX++;
    }
    H = i;
    idY++;
  }
 
  return dots;
  

}



