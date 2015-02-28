
/* visual clock by Melanie Kim */
//millis sync checking code from Golan Levin
int prevSecond;
int lastRolloverTime;
PFont font;
float[][] arcvars;
float[][] ellipsevars;
float r, g, b;
float dx, dy;
int counter;
int rotatecount;
boolean plsrotate;
boolean poofed;
float savedx, savedy;
float startx, starty;
float sizexy;
float arcgradient;

void setup() {
  size(600, 700);
  background(0);
  smooth();
  font = createFont("BookmanOldStyle-Bold", 20);
  textFont(font, 20);
  float startx = random(100, 500);
  float starty = random(0, 400);
  poofed = false;
  plsrotate = false;
  ellipsevars = new float[60][4];
  for (int s = 0; s<second(); s++) {
    ellipsevars[s][0] = random(20, 30); //sizexy
    ellipsevars[s][1] = random(100, 500); //savedx
    ellipsevars[s][2] = random(100, 600); //savedy
  }
}

void draw() {  
  //representation of seconds
  for (int s = 0; s<second()+1; s++)
    ring(ellipsevars[s][0], ellipsevars[s][1]+random(-1, 1), ellipsevars[s][2]+random(-1, 1));

  //background+frames
  if (0<=hour() && hour()<8)//blue bias
  {
    r = random(100, 150);
    g = random(100, 150);
    b = random(100, 200);
  }
  else if (8<=hour() && hour()<16) //green bias
  {
    r = random(100, 150);
    g = random(100, 200);
    b = random(100, 150);
  }
  else if (16<=hour() && hour()<24)//red bias
  {
    r = random(100, 200);
    g = random(100, 150);
    b = random(100, 150);
  }
  fill(r, g, b, 50);
  rectMode(CORNER);
  rect(-50, -50, width+100, height+100);
  frames();

  //checking millis()  
  if (second()!= prevSecond) {
    lastRolloverTime = millis();
  }
  int mils = millis() - lastRolloverTime;
  prevSecond = second();

  //representation of minutes (arcs)
  if (poofed == true) {
    arcgradient = 255;
    arcvars = new float[minute()+1][3];
    for (int i = 0; i<minute()+1; i++) {
      remnants(mils, i);
    }
    counter = 0;
    poofed = false;
    plsrotate = true;
  }

  //rotate the arcs
  if (plsrotate == true) {
    pushMatrix();
    translate(savedx, savedy);
    rotate(rotatecount*0.05);
    for (int i = 0; i<minute(); i++) {
      noFill();
      strokeWeight(1);
      arc(0, 0, arcvars[i][0], arcvars[i][0], arcvars[i][1], arcvars[i][2]);
    }
    popMatrix();
    rotatecount++;
  }
  if (rotatecount == 15) {
    plsrotate = false;
    rotatecount = 0;
  }

  if (mils == 0 && second() != 0) {
    poof();
    poofed = true;
    startx = random(100, 500);
    starty = random(0, 400);
  }

  if (mils == 0 && second() == 0)
    ellipsevars = new float[60][4];

  if (mils < 900 && second() == 0 && minute()!= 0 && hour() !=0) //after a minute
    message("SOMEWHAT CLOSER TO DEATH");
  else if (mils < 900 && second() == 0 && minute() == 0 && hour() !=0) //after an hour
    message("CLOSER TO DEATH");
  else if (mils < 900 && second() ==0 && minute() == 0 && hour() == 0) //after a day
    message("REPENT");

  dx = startx;
  dy = starty + map(mils, 0, 1000, 0, 200);
  drop();

  if (mousePressed == true) { //limited interactivity
    fill(255, 100);
    rect(0, 0, width, height);
    message("LET GO");
  }
}

void frames() {
  fill(255);
  rect(0, 0, 10, 700);
  rect(0, 0, 600, 10);
  rect(590, 0, 10, 700);
  rect(0, 690, 600, 10);
}

void message(String m) {
  if (mousePressed == true)
    fill(r, g, b);
  else
    fill(255);
  textAlign(CENTER);
  text(m, width/2+random(-1, 1), height/2+random(-1, 1));
}

//millis indicator
void drop() {
  stroke(255);
  strokeWeight(5);
  line(dx, dy, dx, dy-10);
}

//seconds indicator
void poof() { //shove info into the ellipsevars matrix
  sizexy = random(20, 30);
  savedx = dx;
  savedy = dy;
  ellipsevars[second()][0] = sizexy;
  ellipsevars[second()][1] = savedx;
  ellipsevars[second()][2] = savedy;
  ring(sizexy, savedx, savedy);
}

//draw ring
void ring(float sxy, float sx, float sy) {
  noFill();
  strokeWeight(1);
  ellipseMode(CENTER);
  float adjustedsize = sxy - 5;
  int gradation = 0;
  for (int i = 0; i<5; i++) {
    stroke(255, gradation);
    ellipse(sx, sy, adjustedsize, adjustedsize);
    gradation+=51;
    adjustedsize++;
  }
  for (int j = 0; j<5; j++) {
    stroke(255, gradation);
    ellipse(sx, sy, adjustedsize, adjustedsize);
    gradation-=51;
    adjustedsize++;
  }
}

//minutes indicator
void remnants(int mils, int count) {
  noFill();
  strokeWeight(1);
  ellipseMode(CENTER);
  pushMatrix();
  translate(savedx, savedy);
  stroke(arcgradient);
  arcvars[count][0] = sizexy+counter;
  arcvars[count][1] = random(0, TWO_PI);
  arcvars[count][2] = arcvars[count][1]+random(HALF_PI, TWO_PI);
  arc(0, 0, arcvars[count][0], arcvars[count][0], arcvars[count][1], arcvars[count][2]);
  popMatrix();
  counter+=10;
  arcgradient-=2;
}


