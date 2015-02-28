
float angle;
float jitter;
PFont universbold;
PFont univers;

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  fill(255);

  universbold = loadFont("UniversLTStd-Bold-48.vlw");
  textFont(universbold, 15);
  univers = loadFont("UniversLTStd-48.vlw");
  textFont(univers, 8);

  rectMode(CENTER);
  frameRate(30);
}

void draw() {
  background(255);

  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 1 == 0) {  
    jitter =random(-0.000000001, 0.01);
  }

  angle = angle + jitter;
  float c = tan(angle);
  translate(width/2, height/2);
  rotate(c);

  //gray
  fill(200, 200);
  rect(20, -5, 460, 350);
  //color
  fill(0, 181, 226);
  rect(0, 0, 440, 350);

  //white
  fill(255);
  rect(180, 1, 130, 352);

  fill(0);
  textFont(universbold);
  textSize(40);
  rotate(-PI/2);
  text("PANTONE", -140, 180);

  textSize(13);
  text("®", 60, 162);

  textFont(univers);
  textSize(28);
  text("306 C", -140, 210);
}

