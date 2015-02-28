
/*
other day i tryed to upload zip file of processing sketch applet but it did'nt work in openprocessing.
that sketch have opengl and peasycam lib, them are unstable in here.
so i retry write code that no peasy cam version on create sketch mode.
if you want to get perfect action plz use peaseycam library.
and, the following code was written by 1.5.1, this version is for version of "152" of peasycam library.
on 2.x, use "201" version and comment out "hint()" method.

im sorry to be poor english.
*/
/*
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import processing.opengl.*;
*/
//plz sotisficate camera position!
int yoko = 35;
int tate = 80;
int haji;
// yoko is col points, tate is row points
// haji is the right end point of col
int meshNum = yoko*tate;
PVector[] Pos;
float x, y;
float seed;
int spaceX, spaceY;
PImage p;

void setup() {
  size(500, 400, OPENGL);
//  hint(ENABLE_OPENGL_4X_SMOOTH);
  /*
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(100);
    */
  smooth();
  spaceX = 30;
  spaceY = 10;
  Pos = new PVector[meshNum];
  for (int i=0; i<meshNum; i++) {
    int row = floor(i/yoko);
    int col = i%yoko;
    x=col*spaceX;      //max (yoko-1)*spaceX
    y=row*spaceY;
    PVector p = new PVector();
    p.x=x;
    p.y=y;
    Pos[i] = p;
    if (row==0)println(Pos[i]);
  }
  haji=(yoko-1)*spaceX;
}
void draw() {
  background(0);
  pushMatrix();
  translate(-width/2, -height/2, -500);
  beginShape(TRIANGLE_STRIP);        //べつにquad_stripでもいいけどこっちのが軽そうだから
  fill(230, 0, 0, 10);
  for (int i=0; i<meshNum; i++) {
    PVector p = Pos[i];
    float z = p.z + noise( (p.x + seed) * .008, (p.y + seed) * .005, (p.z+seed) * .009)* 600;
    /* --- 力業で強引に折り返しの線を消す
    （noStroke()にするとそのあとでsrokeとstrokeWeight直しても
    なぜかすべて消える--- */
    if (p.x==haji || p.x==0){
      pushMatrix();
    stroke(0, 0);
    strokeWeight(.000000001);
 //   noStroke();
    popMatrix();
    }else{
      strokeWeight(.5);
      stroke(255, 30);
    }
    vertex(p.x, p.y, z);
    vertex(p.x+.1, p.y, z);
  }
  endShape();
  popMatrix();
  seed++;
}

void mousePressed(){
//  saveFrame("test.png");
}
