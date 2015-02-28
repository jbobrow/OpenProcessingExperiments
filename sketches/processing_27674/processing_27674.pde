
float angle1;
float angle2;
float angle3;

// s sequence
// blue is 12am to 6am
// green is 6am to 12pm
// yellow is 12pm to 6pm
// red is 6pm to 12am

int cr = 255;
int cg = 255;
int cb = 0;

int x = 20;

PFont HelveticaBold;

void setup() {
  size(640, 480);
  smooth();
  frameRate(60);

  HelveticaBold = loadFont("HelveticaNeue-CondensedBold-100.vlw");
  textFont(HelveticaBold, 60);
}

void draw() {
  background(0);

  float h = hour();
  float m = minute();
  float s = second();
  float ms = second();

  ms = millis() % 1000;


  m = map(m, 0, 59, -90, 264);
  s = map(s, 0, 59, -90, 264);
  ms = map(ms, 0, 999, -90, 264);

  strokeCap(SQUARE);
  strokeWeight(x);

  // alignment window
  pushMatrix();
  translate(width/2, height/2);
  fill(cr * .08333, cg * .08333, cb * .08333);

  arc(0, 0, x * 666.666, x * 666.666, 1.5*PI - PI/10, 1.5*PI + PI/10);
  popMatrix();

  noFill();

  // outer circle
  pushMatrix();
  int colorm = minute();
  int colors = second();
  int colorms = millis() % 1000;

  if (colorm == 0 && colors >= 0 && colors < 3) { // fade in
    float colorRatio = map(colors, 0*1000, 3*1000, 0.08333, 1);
    stroke(cr, cg, cb);
  } 
  else { // normal
    stroke(cr * .08333, cg * .08333, cb * .08333);
  }
  translate(width/2, height/2);
  ellipse(0, 0, x * 16.666, x * 16.666);
  popMatrix();

  // milliseconds
  pushMatrix();

  if (colorm == 0 && colors >= 0 && colors < 3) { // fade in
    float colorRatio = map(colors, 0*1000, 3*1000, 0.08333, 1);
    stroke(cr, cg, cb);
  } 
  else { // normal
    stroke(cr * .166, cg * .166, cb * .166);
  }
  translate(width/2, height/2);
  rotate(radians(ms));
  arc(0, 0, x * 13.333, x * 13.333, PI/10, PI+(PI*9/10));
  popMatrix();

  // seconds
  pushMatrix();
  int colorS = millis() % 1000;

  if (colorm == 0 && colors >= 0 && colors < 3) { // fade in
    float colorRatio = map(colors, 0*1000, 3*1000, 0.08333, 1);
    stroke(cr, cg, cb);
  } 
  else { // normal
    stroke(cr * .25, cg * .25, cb * .25);
  }
  translate(width/2, height/2);
  rotate(radians(s));
  arc(0, 0, x * 10, x * 10, PI/10, PI+(PI*9/10));
  popMatrix();

  // minutes
  pushMatrix();
  if (colorm == 0 && colors >= 0 && colors < 3) { // fade in
    float colorRatio = map(colors, 0*1000, 3*1000, 0.08333, 1);
    stroke(cr, cg, cb);
  } 
  else { // normal
    stroke(cr * .5, cg * .5, cb * .5);
  }
  translate(width/2, height/2);
  rotate(radians(m));
  arc(0, 0, x * 6.666, x * 6.666, PI/10, PI+(PI*9/10));
  popMatrix();

  // center circle
  pushMatrix();
  stroke(cr, cg, cb);
  fill(cr, cg, cb);
  translate(width/2, height/2);
  ellipse(0, 0, x * 3.333, x * 3.333);
  popMatrix();

  //  hours
  fill(0);
  String time = nf(int(h), 2);
  text(time, width/2 -32, height/2 +22);

  // changing color every hour
  if (h == 0) { 
    cr = 0;
    cg = 0;
    cb = 255;
  } 
  else if (h == 1) {
    cr = 63;
    cg = 100;
    cb = 155;
  } 
  else if (h == 2) {
    cr = 70;
    cg = 117;
    cb = 145;
  } 
  else if (h == 3) {
    cr = 77;
    cg = 134;
    cb = 132;
  } 
  else if (h == 4) {
    cr = 86;
    cg = 151;
    cb = 117;
  } 
  else if (h == 5) {
    cr = 96;
    cg = 169;
    cb = 94;
  } 
  else if (h == 6) {
    cr = 0;
    cg = 255;
    cb = 0;
  } 
  else if (h == 7) {
    cr = 132;
    cg = 196;
    cb = 65;
  } 
  else if (h == 8) {
    cr = 156;
    cg = 203;
    cb = 61;
  } 
  else if (h == 9) {
    cr = 180;
    cg = 211;
    cb = 55;
  } 
  else if (h == 10) {
    cr = 202;
    cg = 219;
    cb = 47;
  } 
  else if (h == 11) {
    cr = 225;
    cg = 227;
    cb = 37;
  } 
  else if (h == 12) {
    cr = 255;
    cg = 255;
    cb = 0;
  } 
  else if (h == 13) {
    cr = 244;
    cg = 205;
    cb = 30;
  } 
  else if (h == 14) {
    cr = 241;
    cg = 176;
    cb = 34;
  } 
  else if (h == 15) {
    cr = 239;
    cg = 146;
    cb = 36;
  } 
  else if (h == 16) {
    cr = 238;
    cg = 118;
    cb = 36;
  } 
  else if (h == 17) {
    cr = 237;
    cg = 83;
    cb = 36;
  } 
  else if (h == 18) {
    cr = 255;
    cg = 0;
    cb = 0;
  } 
  else if (h == 19) {
    cr = 210;
    cg = 49;
    cb = 59;
  } 
  else if (h == 20) {
    cr = 184;
    cg = 61;
    cb = 82;
  } 
  else if (h == 21) {
    cr = 158;
    cg = 69;
    cb = 102;
  } 
  else if (h == 22) {
    cr = 131;
    cg = 75;
    cb = 122;
  } 
  else if (h == 23) {
    cr = 100;
    cg = 79;
    cb = 142;
  }
}


