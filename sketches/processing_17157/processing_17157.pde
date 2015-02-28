
import processing.opengl.*;

int cx,cy;
int rs = 25;
int hs = 5;
int rm = 20;
int hm = 10;
int rh = 15;
int hh = 15;
int rf = 30;
int hf = 3;
float s,m,h;
float pt = TWO_PI/360;

float hp = HALF_PI;

Seconds seconds;
Minutes minutes;
Hours hours;
Foot foot;

void setup() {
  size( 450, 450, P3D); 
  camera(cx,cy,180,cx,cy,0,0,1,1);
  cx = width/2;
  cy = height/2;
  fill(255,0,0);
  noStroke();
}

void draw() {
    directionalLight(255,255,255, 0, 0, -1);
  directionalLight(200, 200, 200, -1, -1, 0);
  directionalLight(200, 200, 200, 1, 1, 0);
  rotateY(radians(mouseX-width/2)/5);
  rotateX(-1*radians(mouseY-height/2)/5);
  translate(-cx,cy,0);
  rotateZ(-HALF_PI);
  background(0);

  //set values for pointers
  s = map( second(), 0, 60, 0, TWO_PI);
  m = map( minute(), 0, 60, 0, TWO_PI);
  h = map( hour(),0, 24, 0, TWO_PI * 2);
  

  h = h%TWO_PI;

  hours = new Hours();
  minutes = new Minutes();
  seconds = new Seconds();
  foot = new Foot();
}


