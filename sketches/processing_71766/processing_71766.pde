
//global
int eyeSize = 20;
int eyeDist = 20;
int eyeLift = 40;
int headHeight = 150;
int headWidth = 100;
int irisSize = 10;
int pupilSize = 5;
int mouthLength = 25;
int noseHeight = 30;
int noseWidth = 10;
color skin = color(150, 150, 150);
color nose = color(150, 150, 10);
color iris = color(0, 50, 250);

void setup() {
  size(400, 400);
}

void draw() {
  //setup
  noStroke();
  smooth();

  //bg
  fill(190, 190, 190);
  rect(0, 0, 400, 400);

  //head
  fill(skin);
  ellipse(width/2, height/2, headWidth, headHeight);
  //nose
  fill(nose);
  rectMode(CENTER);
  rect(width/2, height/2, noseWidth, noseHeight);
  //mouth
  fill(0);
  rect(width/2, height/2+50, mouthLength, 5);
  //eyes
  fill(255);
  ellipse(width/2-eyeDist, height/2-eyeLift, eyeSize, eyeSize);
  ellipse(width/2+eyeDist, height/2-eyeLift, eyeSize, eyeSize);
  fill(iris);
  ellipse(width/2-eyeDist, height/2-eyeLift, irisSize, irisSize);
  ellipse(width/2+eyeDist, height/2-eyeLift, irisSize, irisSize);
  fill(0);
  ellipse(width/2-eyeDist, height/2-eyeLift, pupilSize, pupilSize);
  ellipse(width/2+eyeDist, height/2-eyeLift, pupilSize, pupilSize);

  rectMode(CORNER);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    eyeDist = (int) random(20, 35);
    eyeLift = (int) random(0, 60);
    eyeSize = (int) random(10, 40);
    irisSize = (int) random(5, 30);
    pupilSize = (int) random(0, 20);
    int rr, rg, rb;
    rr = (int) random(0, 255);
    rg = (int) random(0, 255);
    rb = (int) random(0, 255);
    iris = color(rr, rg, rb);
  }
  if (mouseButton == RIGHT) {
    headHeight = (int) random(110, 170);
    headWidth = (int) random(90, 160);
    noseHeight = (int) random(10, 60);
    noseWidth = (int) random(3, 30);
    int fr, fg, fb, nr, ng, nb;
    fr = (int) random(100, 200);
    fg = (int) random(100, 200);
    fb = (int) random(100, 200);
    skin = color(fr, fg, fb);
    nr = (int) random(150, 255);
    ng = (int) random(150, 255);
    nb = (int) random(150, 255);
    nose = color(nr, ng, nb);
    mouthLength = (int) random(10, 50);
  }
}
