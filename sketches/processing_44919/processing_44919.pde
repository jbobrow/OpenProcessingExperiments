
/* 
 Daniel C. Young
 Pattern Generator
 11/02/2011
 
 INSTRUCTIONS
 Generates randomized patterns every second.
 Press ‘s’ to save to a PDF file.
 */
import processing.pdf.*;
PGraphicsPDF pdf;

int fgHue=45;
int bgHue=10;
int cols=14;
int rows=22;
float x1, y1, x2, y2;
float radius=50;
float minAng=215;
float maxAng=325;
float[] ypos=new float[3];
float[] ypos2=new float[3];
float[] ang=new float[3];
float[] ang2=new float[3];
boolean record;

void setup() {
  size(700, 900);
  smooth();
  colorMode(HSB, 100);
  frameRate(1); 
}

void draw() {
  if (record) {
    pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "letterhead.pdf");    
    beginRecord(pdf);
    pdf.colorMode(HSB, 100);
  }
  
  background(bgHue, 2, 99);
  
  for (int i=0;i<cols;i++) {
    for (int j=0;j<rows;j++) {
      if(j%2==0){
        // ofset grid for even rows
        drawLogo(i*(width+30)/cols-10, j*(height+10)/rows);
      }else{
        drawLogo(i*(width+30)/cols, j*(height+10)/rows);
      }
    }
  }
  
  if (record) {
    endRecord();
	record = false;
  }
}

void drawLogo(int _x, int _y){
  pushMatrix();
  translate(_x+15, _y);
  scale(0.1);
  for (int i=0;i<3;i++) {
    ypos[i]=ypos2[i];
    ang[i]=ang2[i];
    color c1 = color(random(fgHue, fgHue+10), random(0, 10), random(25, 75), 50);
    color c2 = color(random(fgHue, fgHue+10), random(0, 10), random(25, 75), 50);
    color c3 = color(random(fgHue, fgHue+10), random(0, 10), random(25, 75), 50);
    float ypos = random(125, 275);
    float ang = custRandom(minAng, maxAng, 265, 285);
    strokeWeight(50);
    drawFigure(-160+(160*i), ypos, ang, c1, c2, c3);
  }
  popMatrix();
}

void drawFigure(float _xpos, float _ypos, float _ang, color _c1, color _c2, color _c3) {
  float rad1=radians(_ang);
  float rad2=radians(_ang-180);

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
  if (key == 's') {
    record = true;
  }
}

