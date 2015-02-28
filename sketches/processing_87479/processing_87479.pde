

int numPixels;
int numPixelsV;
int blockSize = 320;
int gs = 320;

color squareColors[];
boolean showRGB = false;

int ax = 160;
int ay = 160;
int bx = 480;
int by = 160;
int cx = 800;
int cy = 160;
int dx = 160;
int dy = 480;
int ex = 480;
int ey = 480;
int fx = 800;
int fy = 480;

int as = 160;
int bs = 160;
int cs = 160;
int ds = 160;
int es = 160;
int fs = 160;

boolean aover; 
boolean bover; 
boolean cover; 
boolean dover; 
boolean eover;
boolean fover; 


String RGBString1 = "";
String RGBString11 = "";
String RGBString111 = "";
String RGBString2 = "";
String RGBString22 = "";
String RGBString222 = "";
String RGBString3 = "";
String RGBString33 = "";
String RGBString333 = "";
String RGBString4 = "";
String RGBString44 = "";
String RGBString444 = "";
String RGBString5 = "";
String RGBString55 = "";
String RGBString555 = "";
String RGBString6 = "";
String RGBString66 = "";
String RGBString666 = "";



void setup() {

size(960,640);
  rectMode(CORNER); 
  noStroke();
  frameRate(18);

  numPixels = width / blockSize;
  numPixelsV = height / blockSize;
  
  squareColors = new color[numPixels * numPixelsV];
  squareColors[0] = color( random(50, 240), random(50, 240), random(50, 240));
  squareColors[1] = color( random(50, 240), random(50, 240), random(50, 240));
  squareColors[2] = color( random(50, 240), random(50, 240), random(50, 240));
  squareColors[3] = color( random(50, 240), random(50, 240), random(50, 240));
  squareColors[4] = color( random(50, 240), random(50, 240), random(50, 240));
  squareColors[5] = color( random(50, 200), random(50, 200), random(50, 200));
}



void mousePressed() {
  aover = (mouseX > ax-as && mouseX < ax+as && mouseY > ay-as && mouseY < ay+as );
  bover = (mouseX > bx-bs && mouseX < bx+bs && mouseY > by-bs && mouseY < by+bs );
  cover = (mouseX > cx-cs && mouseX < cx+cs && mouseY > cy-cs && mouseY < cy+cs ); 
  dover = (mouseX > dx-ds && mouseX < dx+ds && mouseY > dy-ds && mouseY < dy+ds );
  eover = (mouseX > ex-es && mouseX < ex+es && mouseY > ey-es && mouseY < ey+es );
  fover = (mouseX > fx-fs && mouseX < fx+fs && mouseY > fy-fs && mouseY < fy+fs );

  if  (aover)
  {  
    squareColors[0] = color( random(50, 240), random(50, 240), random(50, 240));
  }
  else if (bover) 
  {
    squareColors[1] = color( random(50, 240), random(50, 240), random(50, 240));
  }
  else if (cover) 
  {
    squareColors[2] = color( random(50, 240), random(50, 240), random(50, 240));
  }
  else if (dover) 
  {
    squareColors[3] = color( random(50, 240), random(50, 240), random(50, 240));
  }
  else if (eover) 
  {
    squareColors[4] = color( random(50, 240), random(50, 240), random(50, 240));
  }
  else if (fover) 
  {
    squareColors[5] = color( random(50, 240), random(50, 240), random(50, 240));
  }
  
}




void draw() {
 for (int j = 0; j < numPixelsV; j++) {
    for (int i = 0; i < numPixels; i++) {
      fill(squareColors[j*numPixels + i]);
      rect(i*blockSize, j*blockSize, blockSize, blockSize);
    }
  }
}




