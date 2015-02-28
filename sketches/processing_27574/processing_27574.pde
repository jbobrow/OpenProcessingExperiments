
/**
 * Animated Julia Fractal
 * by Luis Gonzalez.  
 * 
 * integer based for speed.
 */

int n[];
int sqr[];

int l42;
int j5;
int l5;

int rh; 
int rw;
int h; 
int w;

// colors
color[] palette;


void setup()
{
  size(900,600);

  // dimensions
  w = width;
  h=height;
  rw=width/2;
  rh=height/2;
  l42 = w * h -1;
  j5 = 4 * -(w >> 1)+ w+rw;
  l5 = 4 * -(h >> 1)+ h+rh;


  // multiply lookup table
  sqr = new int[2048];
  for(int i = 0; i < 2048; i++){
    sqr[i] = ((i*i) / 256);
  }

  // sin lookup table
  n = new int[2048];
  for(int l1 = 0; l1 < 2048; l1++) {
    n[l1] = (int)(double)(65535 * Math.sin( ( ((double)l1 * Math.PI) / (double)512)) * 256)>>16  ;
  }

  // generate color palette in RGB.
  palette = new color[32];
  for(byte i=0; i<32; i++) {
    palette[i]  = color(0,atan(i*.2)*128,sin(i*.4)*128);      // Black to red
  }
}

void draw(){
  int j = millis() ;  

  int j10 = (n[j >> 3 & 0x3ff] ) ;
  int k10 = (n[j >> 2 & 0x3ff] ) ;
  int k4 = 0;
  int l4 = l42;
  loadPixels();  
  for(int y = l5; y < 0; y++)
  {
    for(int x = j5; x < rw; x++)
    {

      int k9 = x; // left shift when going smaller
      int l9 = y;
      int i=0;
      for (; i<15; i++) {
        int k9Sq = sqr[(k9 < 0) ? -k9 : k9]; // faster than Math.abs(k9)
        int l9Sq = sqr[(l9 < 0) ? -l9 : l9]; // faster than Math.abs(l9)

        if ( k9Sq + l9Sq > 1024 ) break;

        int i9 = k9;
        int j9 = l9;
        k9 = (k9Sq  - l9Sq)+ j10;
        l9 = ( (i9 * j9) << 1 >> 8)+ k10;

      }                    
      int fractalPixel = palette[i]; // color(i<<3,i<<2,i<<3);

      pixels[k4++] = fractalPixel; //top half
      pixels[l4--] = fractalPixel; //bottom half
    }
  }
  updatePixels();
}







