
/** HilfikerUhr 2012/11/06 by Peter Bosshard Schneider<br />
* A reconstruction of the swiss railway clock designed by Hans Hilfiker in 1955.*/
float side, cx, cy, zd, ozr, ozr1, ozr2, lstop, lsbot, wstop, wsbot, lmtop, lmbot, wmtop, wmbot, lhtop, lhbot, whtop, whbot;
float startangle = 0;
float endangle_sec, endangle_min, endangle_hrs;
color colors[];
int fps = 18;
int delay_sec = 2;
float anginc;
float shadowscale;
int last_minute;
boolean minute_done = false;


void setup() {
 // size(displayWidth,displayHeight); //fullscreen
  size(500, 500); // the size should be a square but it hasn't to be
  colors = new color[5];
  colors[0] = color(51,51,51);
  colors[1] = color(255,0,0);
  colors[2] = color(255,255,255);
  colors[3] = color(0,0,0,51);
  colors[4] = color(153);
  background(0);
  if(width>=height){  // considering aspect ratio
    side = height;
  }else{
    side = width;
  }
  cx = width/2;              // center x
  cy = height/2;             // center y
  
  // layout variables scaled, so that you can choose an arbitrary size in the setup method
  shadowscale = side/500.0;   // scalefactor for shadows
  zd = (side*0.88) +(5*shadowscale);           // clockface diameter
  ozr = side*0.41;          // outer clock dial radius
  ozr1 = side*0.38;         // outer clock dial radius
  ozr2 = side*0.31;         // outer clock dial radius
  lstop = side*0.264;       // second handle top length
  lsbot = side*0.14;        // second handle bottom length
  wstop = side*0.012;       // topwidth of second handle
  wsbot = wstop;             // bottom width of second handle
  lmtop = side*0.375;       // minute handle top length
  lmbot = side*0.10;        // minute handle bottom length
  wmtop = side*0.015;       // topwidth of minute handle
  wmbot = side*0.025;       // bottom width of minute handle
  lhtop = side*0.264;       // hour handle top length
  lhbot = side*0.10;        // hour handle bottom length
  whtop = side*0.022;       // topwidth of hour handle
  whbot = side*0.027;       // bottom width of hour handle
  
  ellipseMode(CENTER);
  noFill();
  smooth();
  last_minute = minute();
  frameRate(fps);
  anginc = TWO_PI/(60.0 - delay_sec) * 1.0/fps;  // angle increment for the seconds handle
  println("Starting clock in " + (60 -second()) + " seconds."); // the clock waits until the current minute is complete before starting
}

void draw() {
  // check if the current minute is competed
  if(last_minute != minute()) minute_done = true;
  if (minute_done) {
    minute_done = false;
    endangle_sec = startangle + anginc;
  }
  // stop the seconds handle if the current minute is not yet completed
  if ((endangle_sec <= TWO_PI+startangle)&&(endangle_sec > startangle)) {
    endangle_sec += anginc + startangle;
  } 
  else {
    endangle_sec = startangle;
  }
  
  // calculate angles for the minutes and hours handles
  float minutes = (((minute()*60)+second())/60.0); // add minutes and seconds
  endangle_min = TWO_PI/60.0*minute()+startangle;
  
  float hours = (((hour()*60)+minutes)/60);        // add minutes and hours
  endangle_hrs = startangle + (TWO_PI/12.0*hours)-TWO_PI;
  
  // update drawing
  background(0);
  
  // draw shape of the clock face
  fill(colors[2]);
  stroke(colors[4]);
  strokeWeight(10*shadowscale);
  ellipse(cx, cy, zd, zd);
  noFill();
  noStroke();

  // draw scale
  skala(cx, cy, ozr, ozr1, ozr2,side*0.032,side*0.012, colors[0], colors[0]);
  
  // draw hours handle shadow
  handleshadow(cx+2*shadowscale, cy+2*shadowscale, lhtop, lhbot, whtop, whbot, endangle_hrs, 3, colors[3], colors[3]);
  // draw minute handle shadow
  handleshadow(cx+3*shadowscale, cy+3*shadowscale, lmtop, lmbot, wmtop, wmbot, endangle_min, 2, colors[3], colors[3]);
  // draw seconds handle shadow
  handleshadow(cx+5*shadowscale, cy+5*shadowscale, lstop, lsbot, wstop, wsbot, endangle_sec, 1, colors[3], colors[3]);
  
  // draw hours handle
  handle(cx, cy, lhtop, lhbot, whtop, whbot, endangle_hrs, 3, colors[0], colors[0]);
  // draw minute handle
  handle(cx, cy, lmtop, lmbot, wmtop, wmbot, endangle_min, 2, colors[0], colors[0]);
  // draw seconds handle
  handle(cx, cy, lstop, lsbot, wstop, wsbot, endangle_sec, 1, colors[1], colors[2]);

  last_minute = minute();
}

// draw scale
void skala(float cx, float cy, float ar, float iar, float ir, float w1, float w2, color fclr, color sclr) //{{{ 
{
  pushStyle();
  for (int i=0;i<360;i++) {
    float angle = radians(i);
    if (i%30 == 0) {  // hours marks
      stroke(sclr);
      strokeWeight(w1);
      strokeCap(SQUARE);
      line(cx+sin(angle)*ar, cy-cos(angle)*ar, cx+sin(angle)*(ir), cy-cos(angle)*(ir));
    }
    else if (i%6 == 0) {  // minutes marks
      stroke(sclr);
      strokeWeight(w2);
      strokeCap(SQUARE);
      line(cx+sin(angle)*ar, cy-cos(angle)*ar, cx+sin(angle)*(iar), cy-cos(angle)*(iar));
    }
  }
  popStyle();
} 

// draw a handle
// center x,center y,toplength, botlength, ,topwidth, botwidth, angle, form 0=line,fillcolor, strokecolor
void handle(float cx, float cy, float topl, float botl, float topw, float botw, float ang, int fo, color fclr, color sclr)//{{{ 
{
  pushStyle();
  pushMatrix();
  translate(cx, cy);
  rotate(ang);
  switch (fo) {
  case 1: // sec handle
    noStroke();
    fill(fclr);
    beginShape();
    vertex(-botw/2, botl);
    vertex(-topw/2, - topl);
    vertex(topw/2, - topl);
    vertex(botw/2, botl);
    endShape(CLOSE);
    ellipse(0,-topl,7.4*topw,7.4*topw);
    stroke(sclr);
    strokeWeight(3);
    point(0,0);
    break;
  case 2: // minute handle
    noStroke();
    fill(fclr);
    beginShape();
    vertex(-botw, botl);
    vertex(-topw, - topl);
    vertex(topw, - topl);
    vertex(botw, botl);
    endShape(CLOSE);
    break;
  case 3: // hour handle
    noStroke();
    fill(fclr);
    beginShape();
    vertex(-botw, botl);
    vertex(-topw, - topl);
    vertex(topw, - topl);
    vertex(botw, botl);
    endShape(CLOSE);
    break;
  default: // probably never called
    noStroke();
    fill(fclr);
    beginShape();
    vertex(-botw, botl);
    vertex(-topw, - topl);
    vertex(topw, - topl);
    vertex(botw, botl);
    endShape(CLOSE);
    break;
  }
  popMatrix();
  popStyle();
}

// draw a handle shadow
// center x,center y,toplength, botlength, ,topwidth, botwidth, angle, form 0=line,fillcolor, strokecolor
void handleshadow(float cx, float cy, float topl, float botl, float topw, float botw, float ang, int fo, color fclr, color sclr)//{{{ 
{
  pushStyle();
  pushMatrix();
  translate(cx, cy);
  rotate(ang);
  switch (fo) {
  case 1: // sec handle
    noStroke();
    fill(fclr);
    beginShape();
    vertex(-botw/2, botl);
    vertex(-topw/2, - topl);
    vertex(topw/2, - topl);
    vertex(botw/2, botl);
    endShape(CLOSE);
    ellipse(0,-topl,7.4*topw,7.4*topw);
    break;
  case 2: // minute handle
    noStroke();
    fill(fclr);
    beginShape();
    vertex(-botw, botl);
    vertex(-topw, - topl);
    vertex(topw, - topl);
    vertex(botw, botl);
    endShape(CLOSE);
    break;
  case 3: // hour handle
    noStroke();
    fill(fclr);
    beginShape();
    vertex(-botw, botl);
    vertex(-topw, - topl);
    vertex(topw, - topl);
    vertex(botw, botl);
    endShape(CLOSE);
    break;
  default: // line
    noStroke();
    fill(fclr);
    beginShape();
    vertex(-botw, botl);
    vertex(-topw, - topl);
    vertex(topw, - topl);
    vertex(botw, botl);
    endShape(CLOSE);
    break;
  }
  popMatrix();
  popStyle();
}



