
// 1010
// 0101  by Jim Bumgardner
 // import processing.opengl.*;
 //   @pjs preload="/1010.png";

PImage tex;
 
void setup()
{
  size(600, 600);
  // size(600,600, OPENGL);
  // hint(ENABLE_OPENGL_4X_SMOOTH);
  // hint(DISABLE_OPENGL_ERROR_REPORT);
   
  smooth();
  tex = loadImage("1010.png");
  tex.loadPixels();
}
 
float  duration = 5*1000;
 
float pinScalarWrap(float v)
{
  if (v < 0) {
    v = -v;
    v = 1-(v-(int) v);
  } else {
    v -= (int) v;
  }
  return v;
}
 
void draw()
{
  background(255);
  noStroke();
 
  loadPixels();
  float r = millis()/duration;
  r -= (int) r;
 
  float r2 = (millis()+duration/2)/duration;
  r2 -= (int) r2;
   
  float startWidth = 1;
  float startHeight = 1;
  float endWidth = tex.width;
  float z = endWidth/startWidth;
 
  int fullImage = width*height;
 
  float curWidth = startWidth*pow(z, r);
  float curLeft = -curWidth/2;
 
  PImage t1 = tex;
   
  PImage t2 = tex;


  for (int i = fullImage-1; i >= 0; --i) {
    int px = (i % width) - (width/2);
    int py = (i / width) - (height/2);
 
    float px1 = px*curWidth/width;
    float py1 = py*curWidth/width;
 
    float fx1 = pinScalarWrap(px1);
    float fy1 = pinScalarWrap(py1);
    int dx1 = (int) (fx1*t1.width) % t1.width;
    int dy1 = (int) (fy1*t1.height) % t1.height;
    float v1 = t1.pixels[dy1*t1.width + dx1] & 0x0FF;
 
 
    float fx2 = pinScalarWrap((.5 + px1/t2.width));
    float fy2 = pinScalarWrap((.5 + py1/t2.width));
    int dx2 = (int) (fx2*t2.width) % t2.width;
    int dy2 = (int) (fy2*t2.height) % t2.height;
 
    float v2 = t2.pixels[dy2*t2.width + dx2] & 0x0FF;
 
    float ra = r*r*(3-2*r);
    int v = (int) ((v2 * ra) + (v1 * (1-ra)));
 
    pixels[i] = v | (v << 8) | (v << 16) | 0xFF000000;
  }
 
  updatePixels();
  if (mousePressed)
    cursor();
}



