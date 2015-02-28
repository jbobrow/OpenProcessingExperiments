
int WIDTH, HEIGHT, ANZ_POINTS_1DIM, ANZ_POINTS_GES, DEPTH,
    anz_rects, alphaVal;
double DELTA, ROT_DELTA, ROT_DELTA_DELTA, rot;
Point pnts[][][];
Rect3D rects[];
PGraphics buffer;

void setup()
{
  // Remove Windowparts
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();

  WIDTH = 400;
  HEIGHT = 400;
  size(WIDTH, HEIGHT, P3D);
  //colorMode(HSB, 100);
  buffer = createGraphics(width, height, P3D);
  frameRate(60);
  background(0);
  noStroke();
  smooth();
  noCursor();
  
  // Set up variables
  ANZ_POINTS_1DIM = 10;
  DELTA = WIDTH/ANZ_POINTS_1DIM;  //Aenderung
  ANZ_POINTS_GES = ANZ_POINTS_1DIM*ANZ_POINTS_1DIM*ANZ_POINTS_1DIM;
  anz_rects = ANZ_POINTS_GES*100; //Stimmt nicht, nur Testwert
  DEPTH = 100;
  ROT_DELTA = 0.11;  //PI/50.0;
  ROT_DELTA_DELTA = 2;
  rot = 0;
  alphaVal = 20;
  
  pnts = new Point[ANZ_POINTS_1DIM][ANZ_POINTS_1DIM][ANZ_POINTS_1DIM];
  rects = new Rect3D[anz_rects];
  
  // Fill Array
  for(int i=0; i<ANZ_POINTS_1DIM; i++)
  {
    for(int j=0; j<ANZ_POINTS_1DIM; j++)
    {
      for(int k=0; k<ANZ_POINTS_1DIM; k++)
      {
        pnts[i][j][k] = new Point((float)(i*DELTA-WIDTH/2), (float)(j*DELTA-HEIGHT/2), (float)(k*DELTA-DEPTH/2));
      }
    } 
  }
  
  createRects();
}

void draw()
{
  background(0);
  
  // With buffer
  buffer.beginDraw();
  buffer.background(0);
  buffer.noStroke();
  buffer.translate(WIDTH/2, HEIGHT/2, DEPTH/2-50);
  buffer.rotateX((float)rot*0.2);
  buffer.rotateY((float)rot);
  buffer.rotateZ((float)rot*0.5);
  drawRects();  
  buffer.endDraw();  
  image(buffer, 0, 0);
  
  rot += ROT_DELTA;
  
}

void drawRects()
{
  for(int i=0; i<anz_rects; ++i)
  {
    rects[i].drawRect3D();   
  } 
}

void createRects()
{
  int curRect = 0;
  for(int i=0; i<ANZ_POINTS_1DIM; i++)
  {
    for(int j=0; j<ANZ_POINTS_1DIM; j++)
    {
      for(int k=0; k<ANZ_POINTS_1DIM; k++)
      {
        checkArraySizeRects(curRect);
        //x-y-Rect
        if( pointExistsInArray( i+1, j, k ) && pointExistsInArray( i, j+1, k ) && pointExistsInArray( i+1, j+1, k ) )
        {
          color col = color(0, random(10, 255), 0);
          rects[curRect] = new Rect3D(pnts[i][j][k], pnts[i+1][j][k], pnts[i+1][j+1][k], pnts[i][j+1][k], col);
          anz_rects = curRect+1;
          curRect++;          
        }
        //y-z-Rect
        if( pointExistsInArray( i, j, k+1 ) && pointExistsInArray( i, j+1, k ) && pointExistsInArray( i, j+1, k+1 ) )
        {
          color col = color(random(10, 255), 0, 0);
          rects[curRect] = new Rect3D(pnts[i][j][k], pnts[i][j][k+1], pnts[i][j+1][k+1], pnts[i][j+1][k], col);
          anz_rects = curRect+1;
          curRect++;          
        }
        //x-z-Rect
        if( pointExistsInArray( i+1, j, k ) && pointExistsInArray( i, j, k+1 ) && pointExistsInArray( i+1, j, k+1 ) )
        {
          color col = color(0, 0, random(10, 255));
          rects[curRect] = new Rect3D(pnts[i][j][k], pnts[i][j][k+1], pnts[i+1][j][k+1], pnts[i+1][j][k], col);
          anz_rects = curRect+1;
          curRect++;          
        }
      }  
    }
  } 
}

int checkArraySizeRects(int pos)
{
  if(pos >= (rects.length-1))
    //Double size of Array
    rects = (Rect3D[])expand(rects);
    return rects.length;
}

boolean pointExistsInArray(int i, int j, int k)
{
  if(i<ANZ_POINTS_1DIM && j<ANZ_POINTS_1DIM && k<ANZ_POINTS_1DIM)
    return true;
  return false;
}

class Rect3D
{
  Point p1, p2, p3, p4;
  color col;
  Rect3D(Point p1, Point p2, Point p3, Point p4, color col)
  {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3; 
    this.p4 = p4;
    this.col = col;
  }
  void drawRect3D()
  {
    
    // WIth buffer
    buffer.fill(col, alphaVal);
    buffer.beginShape();
    buffer.vertex(p1.x, p1.y, p1.z);
    buffer.vertex(p2.x, p2.y, p2.z);  
    buffer.vertex(p3.x, p3.y, p3.z);  
    buffer.vertex(p4.x, p4.y, p4.z);  
    buffer.endShape(CLOSE);
  }
  
}

class Point
{
  float x, y, z;
  Point()
  {
    this.x = 0.0;
    this.y = 0.0;
    this.z = 0.0;
  }
  Point(float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  void drawPnt()
  {
    point(this.x, this.y, this.z);  
  }
}


