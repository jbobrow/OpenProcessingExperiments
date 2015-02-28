
PFont fontA;
int numPixels;
int numPixelsV;
int blockSize = 266;
int gs = 266;

color squareColors[];
boolean showRGB = false;

int ax = 133;
int ay = 133;
int bx = 399;
int by = 133;
int cx = 665;
int cy = 133;
int dx = 133;
int dy = 399;
int ex = 399;
int ey = 399;
int fx = 665;
int fy = 399;

int as = 133;
int bs = 133;
int cs = 133;
int ds = 133;
int es = 133;
int fs = 133;

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


void keyReleased() {
  
 if (key == 'r' || key == 'R') {
    squareColors[0] = color( random(50, 250), random(50, 250), random(50, 250));
    squareColors[1] = color( random(50, 250), random(50, 250), random(50, 250));
    squareColors[2] = color( random(50, 250), random(50, 250), random(50, 250));
    squareColors[3] = color( random(50, 250), random(50, 250), random(50, 250));
    squareColors[4] = color( random(50, 250), random(50, 250), random(50, 250));
    squareColors[5] = color( random(50, 250), random(50, 250), random(50, 250));
  }

if (key == 'v' || key == 'V') {
    showRGB = !showRGB;
  }  
}


void setup() {
//798 532 801,534
size(798, 532);
  rectMode(CORNER); 
  noStroke();
  frameRate(12);

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




//////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw() {

  fontA = loadFont("united25.vlw");
  textFont(fontA, 20);

  // pobarva kvadrate    
  for (int j = 0; j < numPixelsV; j++) {
    for (int i = 0; i < numPixels; i++) {
      fill(squareColors[j*numPixels + i]);
      rect(i*blockSize, j*blockSize, blockSize, blockSize);
    }
  }


  if (keyPressed == true && (key == 'f' || key == 'F')) {
    squareColors[0] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[1] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[2] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[3] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[4] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[5] = color( random(50, 200), random(50, 200), random(50, 200)); 
  }
  

rgb();


}


void rgb() {
    if (showRGB) {
  fill(255);
  textAlign(LEFT);

  int a = get(30, 40);
  int red1 = int(red(a)); 
  int green1 = int(green(a));
  int blue1 = int(blue(a)); 
  RGBString1 = str(red1);
  RGBString11 = str(green1);
  RGBString111 =  str(blue1);
  text(RGBString1, 25, 39);
  text(RGBString11, 25, 64);
  text(RGBString111, 25, 89);

  int b = get(400, 40);
  int red2 = int(red(b)); 
  int green2 = int(green(b));
  int blue2 = int(blue(b)); 
  RGBString2 = str(red2); 
  RGBString22 = str(green2); 
  RGBString222 = str(blue2);
  text(RGBString2, 345-54, 39);
  text(RGBString22, 345-54, 64);
  text(RGBString222, 345-54, 89);

  int c = get(700, 40);
  int red3 = int(red(c)); 
  int green3 = int(green(c));
  int blue3 = int(blue(c)); 
  RGBString3 = str(red3); 
  RGBString33 = str(green3); 
  RGBString333 = str(blue3);
  text(RGBString3, 665-108, 39);
  text(RGBString33, 665-108, 64);
  text(RGBString333, 665-108, 89);

  int d = get(30, 350);
  int red4 = int(red(d)); 
  int green4 = int(green(d));
  int blue4 = int(blue(d)); 
  RGBString4 = str(red4); 
  RGBString44 = str(green4); 
  RGBString444 = str(blue4);
  text(RGBString4, 25, 359-54);
  text(RGBString44, 25, 384-54);
  text(RGBString444, 25, 409-54);

  int e = get(400, 350);
  int red5 = int(red(e)); 
  int green5 = int(green(e));
  int blue5 = int(blue(e)); 
  RGBString5 = str(red5); 
  RGBString55 = str(green5); 
  RGBString555 = str(blue5);
  text(RGBString5, 345-54, 359-54);
  text(RGBString55, 345-54, 384-54);
  text(RGBString555, 345-54, 409-54);

  int f = get(700, 350);
  int red6 = int(red(f)); 
  int green6 = int(green(f));
  int blue6 = int(blue(f)); 
  RGBString6 = str(red6); 
  RGBString66 = str(green6); 
  RGBString666 = str(blue6);
  text(RGBString6, 665-108, 359-54);
  text(RGBString66, 665-108, 384-54);
  text(RGBString666, 665-108, 409-54);


  }
}


