

//---------------------------------------------------------------
// sketch:  Belousov_Zhabotinsky_Reaction_V2.pde
//
// Idealised BELOUSOV-ZHABOTINSKY reaction
// (c) Alasdair Turner 2009
// Free Software, Licensed according to the GNU GPL
// 
// see: http://en.wikipedia.org/wiki/Belousov-Zhabotinsky_reaction
// An implementation note about this algorithm is available here:
// http://www.aac.bartlett.ucl.ac.uk/processing/samples/bzr.pdf
//
// v2.0  2011-08-08  scrollbars for interactive value change added   
// v2.1  2012-04-23  adaption for updated HScrollbar.pde and Button.pde
// v2.2  2012-05-04  +60% accelarated using 1-dimensional data fields
//
// mouse buttons:
//     left - change values and press buttons
//   center - reset values
//    right - random dots
//---------------------------------------------------------------

HScrollbar scrollbar1, scrollbar2, scrollbar3, scrollbar4;
Button RandomButton, DotButton, LineButton, CrossButton;

float [] a,b,c;     // data fields
 
int w = 319;
int h = 319;
int pixels = w*h;
int dataSize = pixels*2;
int p = 0, q = pixels;   // data offsets

int xoff = w-60;    // for scrollbar & text
int yoff = h+14;

float aa = 0.0;     // simulation constants
float bb = 0.0;
float cc = 0.0;
float hue = 0.2;    // color
float sat = 0.8;
PFont myFont;       // font

//------------------------------------
void ResetValues()
{
  scrollbar1.resetValue();
  scrollbar2.resetValue();
  scrollbar3.resetValue();
  scrollbar4.resetValue();
}
//------------------------------------
void RandomDots()
{
  for (int ni = p; ni < pixels+p; ni++) 
  {
    a[ni] = random(0.0, 1.0);
    b[ni] = random(0.0, 1.0);
    c[ni] = random(0.0, 1.0);
//    set(x,y,color(hue, sat, a[ni]));
  }
}
//------------------------------------
void Clear()
{
  for (int ni = p; ni < pixels+p; ni++) 
  {
    a[ni] = 0.5;
    b[ni] = 0.5;
    c[ni] = 0.5;
  }
}
//------------------------------------
void OneDot()
{
  Clear();
  int offset = w*h/2 + p;
  a[offset] = 1.0;    
  b[offset] = 0.5; 
  c[offset] = 0.0;
}
//------------------------------------
void OneHLine()
{ 
  Clear();
  int offset = h/2*w + p;
  for (int x = 0; x < w; x++) 
    a[offset+x] = 1.0;
}
//------------------------------------
void OneCross()
{
  Clear();
  // vertical line
  int offset = w/2 + p;
  for (int y = 0; y < h; y++) 
    a[offset+y*w] = 1.0;
  // horizontal line
  offset = h/2*w + p;
  for (int x = 0; x < w; x++) 
    a[offset+x] = 1.0;
}
//------------------------------------
void setup()
{
  size(w,h+100);
  background(0);
  myFont = createFont("FFScala", 13, false);
  textFont(myFont);
  
  scrollbar1 = new HScrollbar(6, yoff,    xoff, 8,  0.0, 1.0, 0.2);
  scrollbar2 = new HScrollbar(6, yoff+16, xoff, 8, -1.0, 1.0, aa);
  scrollbar3 = new HScrollbar(6, yoff+32, xoff, 8, -1.0, 1.0, bb);
  scrollbar4 = new HScrollbar(6, yoff+48, xoff, 8, -1.0, 1.0, cc);

  RandomButton = new Button(  6, height-26, 52, 20, "random");
  DotButton    = new Button( 68, height-26, 52, 20,    "dot");
  LineButton   = new Button(130, height-26, 52, 20,   "line");
  CrossButton  = new Button(191, height-26, 52, 20,  "cross");
  
  a = new float [dataSize];
  b = new float [dataSize];
  c = new float [dataSize];
  RandomDots();
}
//------------------------------------
void draw()
{
//  if (frameCount % 100 != 0) return;   // slow down
  int xx,yy,ni;

  colorMode(HSB, 1.0);
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      float c_a = 0.0;
      float c_b = 0.0;
      float c_c = 0.0;
      for (int j = y - 1; j <= y+1; j++) {
        yy = (j+h)%h;
        for (int i = x - 1; i <= x+1; i++) {
          xx = (i+w)%w;
          ni = yy*w+xx + p;
          c_a += a[ni];
          c_b += b[ni];
          c_c += c[ni];
        }
      }
      c_a /= 9.0 + aa;
      c_b /= 9.0 + bb;
      c_c /= 9.0 + cc;
      // adjust these values to alter behaviour
      ni = y*w + x + q;
      a[ni] = constrain(c_a + c_a * (c_b - c_c), 0, 1);
      b[ni] = constrain(c_b + c_b * (c_c - c_a), 0, 1);
      c[ni] = constrain(c_c + c_c * (c_a - c_b), 0, 1);

      set(x,y, color(hue, sat, a[ni]));
    }
  }
  if (p == 0) { p = pixels; q = 0; }
  else        { p = 0; q = pixels; }

  // handle scrollbar
  colorMode(RGB);
  noStroke();
  fill (0.2);
  rect (0,h, w,100);
  hue = scrollbar1.update();
  aa  = scrollbar2.update();
  bb  = scrollbar3.update();
  cc  = scrollbar4.update();
  int xt = xoff+12;
  fill (0.8);
  textAlign (LEFT);
  text("v=" +nf(hue,0,2),xt, yoff+4);
  text("a=" +nf(aa,0,2), xt, yoff+20);
  text("b=" +nf(bb,0,2), xt, yoff+38);
  text("c=" +nf(cc,0,2), xt, yoff+54);
  text ("fps: " + nf(frameRate,0,2), xt-16,h+90);

  RandomButton.update();
  DotButton.update();
  LineButton.update();
  CrossButton.update();
}
//------------------------------------
void mousePressed() 
{ 
  if      (mouseButton == CENTER) ResetValues();
  else if (mouseButton == RIGHT)  RandomDots();
}
//------------------------------------
void mouseReleased() 
{ 
  if (RandomButton.mouseIsOver()) RandomDots(); 
  if (DotButton.mouseIsOver()) OneDot(); 
  if (LineButton.mouseIsOver()) OneHLine(); 
  if (CrossButton.mouseIsOver()) OneCross(); 
}


