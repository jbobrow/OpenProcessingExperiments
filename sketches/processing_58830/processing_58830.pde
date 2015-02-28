

// Spiral_Starburst
// http://www.openprocessing.org/sketch/58830
// original 'Log Starburst' by Jim Baumgardner
// http://www.openprocessing.org/sketch/1255
// hint: Mouse click changes animation parameters!
//  v1.0  2012-04-11   initial release
//  v1.1  2013-02-18   mouseDragged added
//  v1.2  2013-02-25   dynamic resolution handling

float sineTable[], dTable[], aTable[];
int pixelCount = 0;
int mx=12, my=64;
boolean showFPS = false;

void setup() 
{
  size(512, 512);
  frameRate(30);
  colorMode(RGB, 2);   // color range 0.0 .. 2.0
  
  // precalculate 1 period of the sine wave (360 degrees)
  sineTable = new float[360];
  for (int i = 0; i < 360; i++) 
    sineTable[i] = sin(radians(i));
}

void draw() 
{
  calcPolarCoord();
  float d, a, r, g, b;
  float t = millis() * 0.005;        // time
  float mr = 1.0 + sin(t*0.414);       
  float mg = 2.0 + cos(t*0.321);       
  float mb = 3.0 + sin(t*0.345);       
  int rr = 1 + mx / 24;
  int rg = 1 + my / 20;
  int rb = 1 + my / 29;
  int offset = 0;
  loadPixels();
  for (int ni = 0; ni < pixelCount; ni++) 
  { a = aTable[offset];     
    d = dTable[offset] * 4 + a;
    r = 1.0 + sineTable[int(degrees(a)*rr) % 360] * sineTable[      int(degrees(d+mr)) % 360] ;
    g = 1.0 + sineTable[int(degrees(a)*rg) % 360] * sineTable[359 - int(degrees(abs(d+mg-t))) % 360];
    b = 1.0 + sineTable[int(degrees(a)*rb) % 360] * sineTable[      int(degrees(d+mb+t)) % 360];
    pixels[offset++] = color(r, g, b);     // set pixel color
  }
  updatePixels();
  //drawTable();   //only for testing
  if (showFPS) 
    text (round(frameRate) +" fps",22,22);  
}

// calculate polar coordination table values
void calcPolarCoord()
{
  int newPixelCount = width*height;
  if (newPixelCount == pixelCount) return;  // no size changes ? ===>
  //println ("size: "+width+"*"+height+" = "+newPixelCount);
  pixelCount = newPixelCount; 
  dTable = new float[pixelCount];  // distance
  aTable = new float[pixelCount];  // angle
  float cx = width/2;              // center x
  float cy = height/2;             // center y
  int n = 0;
  for (int y = 0; y < height; y++) 
    for (int x = 0; x < width; x++) 
      if ((x != cx) || (y != cy)) 
      { dTable[n] = log(0.1+dist(x, y, cx, cy));
        aTable[n++] = atan2(y - cy, x - cx) + PI;
      }
}

void drawTable()   // only for testing
{
  for (int xi = 0; xi < width; xi++) 
  { stroke(1+sineTable[(frameCount+xi)%360]);
    line (xi,0,xi,20);
  }  
}

void mousePressed()
{
  mx = mouseX;
  my = mouseY;
}

void mouseDragged()
{
  mx = abs(mouseX);
  my = abs(mouseY);
}

void keyPressed()
{
  if      (key == 's') save ("Spiral_Starburst.png");
  else if (key == 'f') showFPS = !showFPS;
  else 
  { mx = int(random(width));
    my = int(random(height));
  }
  // only for testing...
  if      (key == '-') size(width-1,height-1);
  else if (key == '+') size(width+1,height+1);
}


