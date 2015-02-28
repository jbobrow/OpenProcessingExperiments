
// Jolyn Sandford
// CMU Electronic Media Studio II
// Sept. 10, 2011

int buttonX = 170;
int buttonY = 100;
int buttonRadius = 20;
float TRED = 0;
float TBLUE = 0;
float TGREEN = 0;
int r, g, b;
int br, bg, bb;

void setup() {
  setupAudio();
  size(500, 500);
  smooth();
}

void draw() {
  smooth();
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  drawButton();
  loopChameleon();
}

void loopChameleon() {
  int oneThirdWidth = width/3;
  int oneFourthHeight = height/4;

  for (int x = 0; x <= 3; x++) {
    for (int y = 0; y <= 4; y++) {
      drawChameleon((oneThirdWidth*x), (oneFourthHeight*y), 200, 200);
    }
  }
}

//Self explanatory
int isTheMouseOverTheButton() {
  if (dist(mouseX, mouseY, buttonX, buttonY) < buttonRadius) {
    return 1;
  }
  else {
    return 0;
  }
}

//draws a button
void drawButton () {
  fill(255, 255, 255);
  strokeWeight(2);
  stroke(0, 0, 0);
  //change the background colour
  if (isTheMouseOverTheButton()==1) {
    fill(r, g, b);
    if (mousePressed) {
      br = r;
      bg = g;
      bb = b;
      background(br, bg, bb);
    }
  }
  else {
    fill(255, 255, 255);
  }
  ellipse (buttonX, buttonY, 2*buttonRadius, 2*buttonRadius);
}

//draws a chameleon
void drawChameleon (int x, int y, int w, int h) {

  //Code from Henry Armero! Transforming an image
  pushMatrix();
  translate(x, y);
  scale((float)w/450, (float)h/450);

  int totalreal = br+bb+bg;
  float chamtotal = TRED+TBLUE+TGREEN;

  smooth();

  if (TRED != br) {
    if (TRED > br) {
      TRED -= 0.1;
    }
    if (TRED < br) {
      TRED += 0.1;
    }
  }
  if (TBLUE != bb) {
    if (TBLUE > bb) {
      TBLUE -= 0.1;
    }
    if (TBLUE < bb) {
      TBLUE += 0.1;
    }
  }
  if (TGREEN != bg) {
    if (TGREEN > bg) {
      TGREEN -= 0.1;
    }
    if (TGREEN < bg) {
      TGREEN += 0.1;
    }
  }

  fill(TRED-10, TGREEN-10, TBLUE-10); //here you need to change fill!
  stroke(TRED-10, TGREEN-10, TBLUE-10); //here you need to change fill!

  //head of chameleon!
  strokeWeight(30);
  strokeJoin(ROUND);
  triangle(25, 120, 95, 75, 95, 120);
  strokeWeight(10);
  arc(60, 130, 100, 100, PI, TWO_PI-0.5);
  arc(103, 135, 170, 50, PI/2, PI);

  //body of chameleon!
  ellipse(180, 130, 200, 100);
  ellipse(200, 110, 160, 100);
  ellipse(250, 170, 60, 60);

  //tail of chameleon
  strokeWeight(5);
  arc(240, 170, 110, 205, -PI/2, PI/2);
  ellipse(230, 230, 88, 86);

  //leg of chameleon
  strokeWeight(20);
  noFill();
  arc(120, 210, 40, 60, PI+(PI/6), (TWO_PI)-(PI/3));

  //gets the volume!
  getVolume();
  float Y = map(volume, 0, 100, 2, 120);

  //this is his eye, it opens wider when you talk and follows your mouse around
  //sclera
  strokeWeight(1);
  stroke(255, 255, 255);
  fill (255, 255, 255);
  ellipse (70, 115, 25, 25);
  //pupil
  fill(0, 0, 0);
  stroke(0, 0, 0);
  float pupilx = constrain((mouseX-200)/30, -4, 4);
  float pupily = constrain((mouseY-100)/30, -4, 4);
  ellipse (70+pupilx, 115+pupily, 13, 13);
  //eyelid
  fill(TRED-10, TGREEN-10, TBLUE-10);
  stroke(TRED-10, TGREEN-2, TBLUE-10);
  float heightOfEyelid = constrain(23-(Y/10), 0, 23);
  rect (55, 95, 30, heightOfEyelid);
  popMatrix();
}


