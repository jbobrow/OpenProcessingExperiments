
// Not quite sure why this takes so long.....  My flood filling skills kind of suck
// original image is here http://gregorylindley.com/school_of_athens.jpg

PImage pattern;
PImage painting;

void setup(){
  pattern = loadImage("white_triangles.gif");
  pattern.loadPixels();
  painting = loadImage("school_of_athens.jpg");
  painting.loadPixels();
  size(640, 320);
  image(painting, 0, 0);
  image(pattern, 0, 0);
}

void draw(){
  for (int y=0; y<height; y++){
    for(int x=0; x<width; x++){
      color PaintingCol = getColor(x, y, painting);
      color PatternCol = getColor(x, y, pattern);
      if (PatternCol == color(255, 255, 255)) {
        if (PaintingCol == color(255, 255, 255)) {
          PaintingCol = color(254, 254, 254);
        }
        floodFillSimple1(x, y, PaintingCol);
      }
    }
  }
}

/* -----------------------------------------------------------------------------
|  Begin FloodFill code, courtesy of http://www.florianjenett.de/p55/
|  -----------------------------------------------------------------------------
|
|  brute force method using stack.
|
|  current pixel: P
|  for every pixel P from stack that is valid
|  set color and put it's 4 neighbors (X) on the stack.
|
|      X
|    X P X
|      X
*/

void floodFillSimple1(int x, int y, int fill_color)
{
  int old_color = get(x,y);
  if( fill_color != old_color ) {
    fillCoordinate fc = new fillCoordinate( x, y, fill_color );
    fillStack1 fs = new fillStack1(fc);
    while (fs.index >= 0)
    {
      fc = fs.popMatrix();
      if (get(fc.x,fc.y) != fill_color & get(fc.x,fc.y) == old_color)
      {
        set(fc.x, fc.y, fc.c);

        fs.pushMatrix(new fillCoordinate( fc.x, fc.y-1, fill_color ));
        fs.pushMatrix(new fillCoordinate( fc.x, fc.y+1, fill_color ));

        fs.pushMatrix(new fillCoordinate( fc.x-1, fc.y, fill_color ));
        fs.pushMatrix(new fillCoordinate( fc.x+1, fc.y, fill_color ));
      }
    }
  }
}

class fillCoordinate
{
  int x; int y; int c;

  fillCoordinate (int _x, int _y, int _c)
  {
    x = _x;
    y = _y;
    c = _c;
  }

  fillCoordinate copy ()
  {
    return new fillCoordinate(x, y, c);
  }
}

class fillStack1
{
  fillCoordinate[] fills;
  int MAX_FILLS = 10000; int index;

  fillStack1( fillCoordinate fc ) {
    fills = new fillCoordinate[MAX_FILLS];
    index = 0;
    fills[index] = fc.copy();
  }

  void pushMatrix(fillCoordinate fc)
  {
    index++;
    if (index < MAX_FILLS) {
      fills[index] = fc.copy();
    }
    else {
      print("FillStackOverFlow ----");
      MAX_FILLS += MAX_FILLS;
      fillCoordinate[] fTemp = new fillCoordinate[MAX_FILLS];
      System.arraycopy(fills, 0, fTemp, 0, fills.length);
      fills = fTemp;
      fills[index] = fc.copy();
      println("Stack resized to: " + MAX_FILLS);
    }
  }

  fillCoordinate popMatrix()
  {
    fillCoordinate fr = fills[index].copy();
    fills[index] = null;
    index--;
    return fr;
  }
}
/* -----------------------------------------------------------------------------
|  End FloodFill code, courtesy of http://www.florianjenett.de/p55/
|  -----------------------------------------------------------------------------
*/

color getColor(int x, int y, PImage img){
  int maxloc= img.width*img.height;
  int loc = (y * img.width) + x;
  if (loc < maxloc){
    return img.pixels[loc];
  } else {
    return 0;
  }
}

