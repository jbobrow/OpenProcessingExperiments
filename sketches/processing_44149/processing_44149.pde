
//"STP"
//by Ed Brown

//pen variables
float bicX= 100;
float bicY = 0;
float bicLength = 630;
float angle1 = 0.0;

//images
PImage backpack;
PImage stp;
PImage bic;

//ink object
Scribble scribbles;
float[] inkX = new float[3000];
float[] inkY = new float[3000];
float[] a = new float[3000];
//ink color variables for easy tweaking
int r=16;
int g=19;
int b=70;


void setup() {
  size(600,483);
  bic=loadImage("bic4.gif");
  stp=loadImage("stp.gif");
  backpack=loadImage("eastpak1.jpg");
  imageMode(CORNERS);
  for (int i=0; i<inkX.length; i++) {
    inkX[i] = 0;
    inkY[i] = 0;
    a[i] = 0;
  }
  scribbles = new Scribble(0,0,0,0,0);
}

void draw() {  
  noCursor();
  background(backpack);
  scribbles.update();
  image(stp,0,0,600,483);
  //PEN
  float dx = mouseX - bicX;
  float dy = mouseY - bicY;
  angle1 = atan2(dy,dx);
  bicX = mouseX - (cos(angle1) * bicLength);
  bicY = mouseY - (sin(angle1) * bicLength);
  pushPen(bicX,bicY,angle1);
}

//ink object is a line object with an alpha channel attached
class Scribble {  
  Scribble(float tempX1, float tempY1, float tempX2, float tempY2, float tempA) {
    for (int i=1; i<inkX.length; i++) {    
      inkX[i] = tempX1;
      inkY[i] = tempY1;
      inkX[i-1] = tempX2;
      inkY[i-1] = tempY2;
      a[i] = tempA;
    }
  }
  
  void update() {    
    for (int i=1; i<inkX.length; i++) {
    stroke(r,g,b,a[i]);
    strokeWeight(4);
    line(inkX[i], inkY[i], inkX[i-1], inkY[i-1]);
  }
    if (mousePressed) {
    for (int i=0; i<inkX.length-1; i++) {
      inkX[i] = inkX[i+1];
      inkY[i] = inkY[i+1];
      a[i] = a[i+1];
    }
//line goes transparent when mouse is released    
      a[a.length-1] = 80;
    }else{
      a[a.length-1] = 0;
    }
    inkX[inkX.length-1] = mouseX;
    inkY[inkY.length-1] = mouseY;    
  }
}

//pen with "follow" attributes
void pushPen(float x, float y, float a) {
  pushMatrix();
  translate(x,y);
  rotate(a);
  image(bic,0,0,bicLength,bicLength);
  popMatrix();
}

