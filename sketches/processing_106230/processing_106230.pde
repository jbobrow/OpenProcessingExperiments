
//Second
float angles = 0;
float offsetsX = 100;
float offsetsY = 150;
float scalars = 2;
float speeds = 0.0087;
float xs;
float ys;
int rs = 4;

//Minute
float anglem = 0;
float offsetmX = 300;
float offsetmY = 150;
float scalarm = 5;
float speedm = 0.000145;
float xm;
float ym;
int rm = 4;

PFont font;

void setup() {
  size(400, 400);
  smooth();
  background(0, 120, 199);
  font = loadFont("TektonPro-Bold-48.vlw");
  Init();
}

void draw() {
  Second();
  Minute();
  //println(hour() + " " + minute() + " " + second());
}

void Init() {
  //Second
  int s = second();
  for (int i = 0; i < s*5*2*PI/60/speeds; i++) {
    xs = offsetsX + cos(angles)*scalars;
    ys = offsetsY + sin(angles)*scalars;
    stroke(255, 194, 172);
    fill(255, 194, 172);
    ellipse(xs, ys, rs, rs);
    angles += speeds;
    scalars += speeds+0.006;
  }

  //Minute
  int m = minute();
  for (int i = 0; i < m*5*2*PI/60/speedm; i++) {
    xm = offsetmX + cos(anglem)*scalarm;
    ym = offsetmY + sin(anglem)*scalarm;
    stroke(255, 143, 121);
    fill(255, 143, 121);
    ellipse(xm, ym, rm, rm);
    anglem += speedm;
    scalarm += speedm+0.0001;
  }

  //Hour
  int h = hour();
  textAlign(CENTER);
  fill(235, 59, 75);
  textFont(font);
  textSize(50);
  text(hour(), 200, 300);
}

void Second() {
  xs = offsetsX + cos(angles)*scalars;
  ys = offsetsY + sin(angles)*scalars;
  stroke(255, 194, 172);
  fill(255, 194, 172);
  ellipse(xs, ys, rs, rs);
  angles += speeds;
  scalars += speeds+0.006;
  if (angles >= 5*2*PI) {
    noStroke();
    fill(0, 120, 199);
    rectMode(CENTER);
    rect(offsetsX, offsetsY, 150, 150);
    angles = 0;
    scalars = 2;
  }
}

void Minute() {
  xm = offsetmX + cos(anglem)*scalarm;
  ym = offsetmY + sin(anglem)*scalarm;
  stroke(255, 143, 121);
  fill(255, 143, 121);
  ellipse(xm, ym, rm, rm);
  anglem += speedm;
  scalarm += speedm+0.0001;
  if (anglem >= 5*2*PI) {
    noStroke();
    fill(0, 120, 199);
    rectMode(CENTER);
    rect(offsetmX, offsetmY, 150, 150);
    rect(200, 300, 100, 100);
    anglem = 0;
    scalarm = 3;
    //Hour
    int h = hour();
    textAlign(CENTER);
    fill(235, 59, 75);
    textFont(font);
    textSize(50);
    text(hour(), 200, 300);
  }
}


