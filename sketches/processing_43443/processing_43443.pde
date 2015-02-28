
//thomas bertling www.thomasworks.com

void setup()
{
  size(500, 800);
  smooth();
  noFill();
  colorMode(HSB, 100);
}

void draw()
{
  int a = 170; // overall width
  int e = 180; // overall up
  int b = 300; // overall down
  
  float mseY = dist(0, mouseY, 0,0);
  float moveY = map(mseY, 0, height, -e,b);
  float c = 55;  // opening width
  float d = 20+moveY;  // opening up
  float f = 12-moveY;  // opening down
  
  background(100);
  //  quad ( ax, ady, bx, cby, cx,  dx, deg);
  drawQuad ( -a,  b,  -c,   d,  c,   a,   0);
  drawQuad ( -e,  a,  -f,   c,  d,   b,  90);
  drawQuad ( -a,  e,  -c,   f,  c,   a, 180);
  drawQuad ( -b,  a,  -d,   c,  f,   e, 270);
}


/* function
 
 -bxy ___ cxy
 ----/   \
 axy/_____\ dxy
 
 */

void drawQuad (float ax, float ady, float bx, float cby, float cx, float dx, float deg)
{
  pushMatrix();
  translate(width/2, 300);
  rotate (radians(deg));
  
  float mseX = dist(mouseX, 0, 0,0);
  float hues = map(mseX, 0, width, 0, 100);
  
  float totalH = dist(0, ady, 0, cby);
  float diffAB = dist(ax, 0, bx, 0);
  float diffDF = dist(cx, 0, dx, 0);
  
  for (int loff = 1; loff < totalH; loff += 1)
  {
    float bri = (10+loff * 100/totalH);
    stroke(hues, hues, hues, bri);
    line(ax+loff*diffAB/totalH, ady-loff, dx-loff*diffDF/totalH, ady-loff);
  }
  stroke(0, 0, 0, 50);
  quad(ax, ady, bx, cby, cx, cby, dx, ady);
  popMatrix();
}


