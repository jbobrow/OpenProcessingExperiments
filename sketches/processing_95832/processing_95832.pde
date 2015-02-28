
PFont fontA;
int numPixels;
int numPixelsV;
int blockSize = 266;
int gs = 266;
 
color squareColors[];
boolean showRGB = false;
PImage miniintro; 

float r = 100.0;
float angle = 0.0;
float speed = 0.4;

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
boolean klik = true;
 
 
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
 
}
 
 
void setup() {
//798 532 801,534
  size(800, 532);
  rectMode(CORNER);
  imageMode(CENTER);
  noStroke();
  frameRate(15);
 // miniintro = loadImage("miniintro.png");
 //  String url = "http://www.openprocessing.org/assets/profileImages/user25053.jpg";
 
  miniintro = loadImage("http://www.openprocessing.org/assets/profileImages/user25053.jpg");
  
  

 
  numPixels = 3;
  numPixelsV = 2; 
   
  squareColors = new color[numPixels * numPixelsV];
  squareColors[0] = color( random(50, 230), random(50, 230), random(50, 230));
  squareColors[1] = color( random(50, 210), random(50, 210), random(50, 210));
  squareColors[2] = color( random(50, 230), random(50, 230), random(50, 230));
  squareColors[3] = color( random(50, 230), random(50, 230), random(50, 230));
  squareColors[4] = color( random(50, 210), random(50, 210), random(50, 210));
  squareColors[5] = color( random(50, 230), random(50, 230), random(50, 230));

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
 
     angle += speed;
  float sinval = sin(angle);
  float yoff = sinval * r;
  float f = map (yoff,-99,99,20,255);
  
   if (mousePressed == true) {klik=false;}

  
  // pobarva kvadrate   
  for (int j = 0; j < numPixelsV; j++) {
    for (int i = 0; i < numPixels; i++) {
      fill(squareColors[j*numPixels + i]);
      rect(i*blockSize, j*blockSize, blockSize, blockSize);
    }
  }
 
color a = get (700,40);
 fill (a);
 rect (795,0,800,266);
 
 color b = get (700,300);
 fill (b);
 rect (795,266,800,532);
 
  if (keyPressed == true && (key == 'e' || key == 'E')) {
    squareColors[0] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[1] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[2] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[3] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[4] = color( random(50, 240), random(50, 240), random(50, 240));
    squareColors[5] = color( random(50, 200), random(50, 200), random(50, 200));
  }
   
    if (klik==true) {
 tint (255,f);
  image(miniintro,width/2,height/2);}
  
 
}
