
/*@pjs preload="apple_white1.png;*/
PImage img;
PFont hello;
int eSize = 19;
int xspeed = 9;  
int yspeed = 6;  
int x = 0; 
int y = 0;  
 int gspeed = 8;  
 int dspeed = 5;  
 int g = 360; 
 int d = 0; 
  int mspeed = 7;  
  int wspeed = 4;  
  int m = 360;
  int w = 360; 
   int aspeed = 6;  
   int bspeed = 3;  
   int a = 0;
   int b = 360; 
    int kspeed = 5;  
    int lspeed = 2;  
    int k = 130;
    int l = 0; 
     int ospeed = 4;  
     int pspeed = 1;  
     int o = 0;
     int p = 130;
      int  u, i;
      int c;
    
     
void setup() {
  size(440, 440);
 hello = loadFont("ArialMT-48.vlw");
 u = width/2;
 i = height/2;
 c = 0;
}

//6applelogos

void draw() {
  img = loadImage("apple_white1.png");
  background(0);
  tint(73, 255, 0);
  image(img, x, y);
 
  
  x = x + xspeed;   
  y = y + yspeed; 
  if (x > width -50|| x < 0) {
    xspeed = -xspeed;
  }

  if (y > height -60|| y < 0) {
    yspeed = -yspeed;
  } 
 
  tint(255, 255, 0);
  image(img, g, d);
  g = g + gspeed;   
  d = d + dspeed; 
  if (g > width -50|| g < 0) {
    gspeed = -gspeed;
  }
  if (d > height -60|| d < 0) {
    dspeed = -dspeed;
  }  

tint(255, 0, 0);
  image(img, a, b);
  a = a + aspeed;   
  b = b + bspeed; 
  if (a > width -50|| a < 0) {
    aspeed = -aspeed;
  }
  if (b > height -60|| b < 0) {
    bspeed = -bspeed;
  }  
  
  tint(255, 124, 0);
  image(img, m, w);
  m = m + mspeed;   
  w = w + wspeed; 
  if (m > width -50|| m < 0) {
    mspeed = -mspeed;
  }
  if (w > height -60|| w < 0) {
    wspeed = -wspeed;
  }  
  
   tint(165, 0, 255);
  image(img, k, l);
  k = k + kspeed;   
  l = l + lspeed; 
  if (k > width -50|| k < 0) {
    kspeed = -kspeed;
  }
  if (l > height -60|| l < 0) {
    lspeed = -lspeed;
  }  
  
   tint(0, 202, 255);
  image(img, o, p);
  o = o + ospeed;   
  p = p + pspeed; 
  if (o > width -50|| o < 0) {
    ospeed = -ospeed;
  }
  if (p > height -60|| p < 0) {
    pspeed = -pspeed;
  }   
   
//stage?
   
   smooth();
  noStroke();
  for (int r = 0; r<= height; r+=20) {
    for (int h = 0; h<= width; h+=20) {
      if (h > 10 && h < 440 && r > 10 && r < 440) {
        fill(0);
      }
      else {
        fill(255);
      }
      ellipse(h, r, eSize, eSize);
    }
  }
}

//PleaseDrag

void mouseDragged() { 
  img = loadImage("apple_white1.png"); 
  tint(73, 255, 0);
  image(img, x, y);
  tint(255, 255, 0);
  image(img, g, d);
  tint(255, 0, 0);
  image(img, a, b);
  tint(255, 124, 0);
  image(img, m, w);
  tint(165, 0, 255);
  image(img, k, l);
  tint(0, 202, 255);
  image(img, o, p);
  textFont(hello, 50);
  fill(0,255,mouseY-75);
  text("Apple", 155, 230);
  
  c ++;
  if(c < 255) {  
    c = 255;
  }
}
 
 
















