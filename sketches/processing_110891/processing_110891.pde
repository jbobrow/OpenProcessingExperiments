
///////////////////////////
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
 
color clr = color(240, 110, 0);
int xt=70, yt=85, anlge=90, direction =-1;
float xRect=0, sp, speedRect=1.472223;
boolean blPin = false, blPinAn = false, bl = false;
ArcFun ARC[] = new ArcFun[8];
 
void setup() {
  size(530, 300);
  frameRate(25);
  for (int i=0; i<2; ++i) {
    for (int j =0; j<ARC.length/2; ++j) {
      ARC[j+(i*ARC.length/2)]= new ArcFun((j*130), i*130, 110, anlge+j*90*-direction, direction);
    }
    anlge=180;
    direction*=-1;
  }
}
 
void draw() {
  background(230, 255, 255);
 
  if (bl) {
    fill(10, 90, 100);
    rectMode(CORNER);
    rect(0, 0, width, 100);
    rect(0, 200, width, height);
  }
 
  pushMatrix();
  translate(xRect +=speedRect, height/2);
  noStroke();
  fill(250, 110, 0, 10);
  if (!bl) ellipse(0, 0, 5, 5);
 
  //noStroke();
  //rectMode(CENTER);
  //fill(200, 30, 0, 10);
  //rect(0, 0, 100, 100);
 
  rotate(radians(sp+=1));
  if (bl) { 
    if (false) {
      fill(250, 110, 30, 30);
      rectMode(CENTER);
      rect(0, 0, 30, 30);
     }
    else {
        rectFly();
    }
  }
  if (xRect>width) xRect=0;
  popMatrix();
  translate(xt, yt);
 
  for (int i=0; i<ARC.length; ++i) {
    ARC[i].draw();
  }
}
 
//----------------------------------------------------------------------
void rectFly(){
fill(clr,70);
noStroke();
int bb=10, bcor=2;
ellipse( -bb/2-bcor,  bb/2+bcor, bb,bb);
ellipse(  bb/2+bcor, -bb/2-bcor, bb,bb);
ellipse(  bb/2+bcor,  bb/2+bcor, bb,bb);
ellipse( -bb/2-bcor, -bb/2-bcor, bb, bb);
rectMode(CENTER);
 
fill(230,255,255);
rect(0,0,20,20,5);
}
 
//----------------------------------------------------------------------
void mousePressed() {
  if (mouseButton==LEFT) {
    bl=!bl;
  }
 
  if (mouseButton==RIGHT) {
    blPin=!blPin;
    blPinAn=false;
  }
 
  else if (mouseButton==CENTER) {
    blPin=false;
    blPinAn=!blPinAn;
  }
}
 
//----------------------------------------------------------------------
class ArcFun {
  int x;      int y ;
  int diam;   int angle;
  float rttStart;
  float speed;
 
  ArcFun(int i_x, int i_y, int i_diam, float i_rttStart, float i_speed) {
    int angle=0;
    x = i_x;
    y = i_y;
    diam = i_diam;
    rttStart = i_rttStart;
    speed=i_speed;
  }
 
  void draw() {
    fill(clr);
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(radians(rttStart+(angle+=speed)));
    for (int i=0; i<5; ++i)
      arc(0+i*4, 0+i*4, diam-i*8, diam-i*8, radians(90), radians(360));
   
    /////////////////////////////////////////      
    float dCor=3;
    rectMode(CORNER);
 
    if (blPin)   { dCor=2.42;  }
    if (blPinAn) { dCor=2;    }
    rect(0, 0, -diam/dCor, -diam/dCor);
    rect(0, 0, diam/dCor, -diam/dCor);
    rect(0, 0, -diam/dCor, diam/dCor);
 
    TrianleIlluzion();
    /////////////////////////////////////////
    popMatrix();
  }
  }
//----------------------------------------------------------------------
void TrianleIlluzion() {
  rotate(radians(17));
 
  for (int i =0; i<10; ++i) {
    if (false) {
      noFill();
      stroke(1);
      strokeWeight(1);
      int rad=7, rp=6;
      arc(-25, -16, rad+i*rp, rad+i*rp, radians(58), radians(362));
      arc( 25, -16, rad+i*rp, rad+i*rp, radians(178), radians(482));
      arc(   0, 29, rad+i*rp, rad+i*rp, radians(-57), radians(237));
    }
 
    else {
      fill(clr);
      if (i%2==0)  fill(65, 105, 45);
      else  fill(clr);
 
      noStroke();
      int rad=30, rp=3;
      ellipse(-25, -16, rad-i*rp, rad-i*rp);
      ellipse( 25, -16, rad-i*rp, rad-i*rp);
      ellipse(  0, 29, rad-i*rp, rad-i*rp);
 
      fill(clr);
      triangle(-25, -16, 25, -16, 0, 29);
    }
 
    if (false) {
      stroke(20, 20);
      line(-25, -16, -25, -16);
      line( 25, -16, 0, 29);
      line(  0, 29, -25, -16);
    }
  }
}
