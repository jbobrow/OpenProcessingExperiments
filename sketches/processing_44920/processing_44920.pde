
/* 
 Daniel C. Young
 Logo and Color Palette Generator
 11/02/2011
 
 INSTRUCTIONS
 New logo iterations are generated every 2 seconds.
 Left click to prevent refresh.
 Press "c" to change color palette.
 Press "r" to obtain variation within same color palette.
 Press "s" to save to a PDF file. 
 */

import processing.pdf.*;
PGraphicsPDF pdf;

color[] clr=new color[9];
int fgHue=50;
int bgHue=10;
int prevMillis=0;
int thresh=2000;
float x1, y1, x2, y2;
float radius=50;
float[] ypos=new float[3];
float[] ypos2=new float[3];
float[] ang=new float[3];
float[] ang2=new float[3];
float easing=0.1;
float minAng=215;
float maxAng=325;
boolean record;
boolean toggleRotate=false;

void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB, 100);
  updatePos();
  updateClr();
}

void draw() {
  if (record) {
    pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "logo.pdf");    
    beginRecord(pdf);
    pdf.colorMode(HSB, 100);
  }

  background(100);
  pushMatrix();
  translate(width/2, height/4);
  

  for (int i=0;i<3;i++) {
    // get new ypos and ease rotation
    ypos[i]=ypos2[i];
    ang[i]+=(ang2[i]-ang[i])*easing;

    // get color from clr[] and draw logo
    strokeWeight(50);
    drawFigure(-160+(160*i), ypos[i], ang[i], clr[0+3*i], clr[1+3*i], clr[2+3*i]);
  }
  
  if (mousePressed){
    prevMillis=millis();
  }else if(millis()-prevMillis>=thresh) {
    updatePos();
    updateClr();
    prevMillis=millis();
  }
  
  popMatrix();

  if (record) {
    endRecord();
    record = false;
  }
}

void drawFigure(float _xpos, float _ypos, float _ang, color _c1, color _c2, color _c3) {
  float rad1=radians(_ang);
  float rad2=radians(_ang-180);

  // start and ending value for middle bar
  x1=_xpos+(radius*cos(rad1));
  y1=_ypos+(radius*sin(rad1));
  x2=_xpos+(radius*cos(rad2));
  y2=_ypos+(radius*sin(rad2));

  stroke(_c1);
  line(_xpos, 0, x1, y1);
  stroke(_c2);
  line(x1, y1, x2, y2);
  stroke(_c3);
  line(x2, y2, _xpos, 390);
}

// generate new values for ypos and angles
void updatePos() {
  for (int i=0;i<3;i++) {
    ypos2[i]=random(125, 275);
    ang2[i]=custRandom(minAng, maxAng, 265, 285);

    // initialize values
    if (ypos[i]==0) {
      ypos[i]=ypos2[i];
      ang[i]=ang2[i];
    }
  }
}

// generate new values for color
void updateClr() {
  for (int i=0;i<9;i++) {
    clr[i] = color(random(fgHue, fgHue+10), random(20, 100), random(15, 95), 60);
  }
}

// generate new foreground hues
void newHue() {
  fgHue=(fgHue+20)%100;
}

// avoid middle ranges between _xlo and _xhi
float custRandom(float _lo, float _hi, float _xlo, float _xhi) {
  // initialize with middle value
  float n=_xlo+(_xhi-_xlo)/2;
  while (n>_xlo && n<_xhi) {
    n=random(_lo, _hi);
  }
  return n;
}

void keyPressed() {
  // get new color palette
  if (key == 'c') {
    newHue();
    updateClr();
  }
  
  // get new variation within same palette
  if (key == 'r') {
    updatePos();
    updateClr();
  }
  
  // save to pdf
  if (key == 's') {
    record = true;
  }
}


