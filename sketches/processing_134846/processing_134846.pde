
float o = 0;
float w = 1.82;
float x = 230;
float y = 240;

float maxspeed = 3.4;
float r = 128;
float g = 10;
float b = 30;
float rspeed = 1;
//from red to yellow:
float gspeed = maxspeed;
float bspeed = 0;
int maxr = 255;
int maxg = 225;
int maxb = 210;
int maxs = 210;
float s = maxs;
void setup() {
  size(500, 500);
  background(0);
}
void draw() {
  // background(0);
  s = s - 0.5;
  o=o+w;
  x=sin(o)*s+250;
  y=cos(o)*s+250;
  fill(r, g, b);
  noStroke();
  point(x, y);
  rect(x, y, 5, 5);
  point(x, y);
  r = r + rspeed;
  g = g + gspeed;
  b = b + bspeed;
  // yellow
  if ((g>=maxg)) {
    gspeed = 0;
    rspeed = -maxspeed;
  }
  //green
  if (r<=0) {
    rspeed = 1;
    bspeed = maxspeed;
  }
  //sky
  if (b>=maxb) {
    bspeed = 0;
    gspeed = -maxspeed;
  }
  //dark blua
  if (g<=0) {
    gspeed = 0;
    rspeed = maxspeed;
  }
  // red
  if (r>=maxr) {
    rspeed = 0;
    bspeed = -maxspeed;
  }//red
  if (b<=-1) {
    bspeed = 0;
    r=210;
    g=0;
    b=0;
    gspeed=maxspeed;
  }
  if (s<=-250) {
    s=s*-1;
  }
}



