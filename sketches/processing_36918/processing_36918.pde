
// Jolyn Sandford
// CMU Electronic Media Studio II
// Sept. 10, 2011

int buttonX = 30;
int buttonY = 30;
int buttonRadius = 20;
int r, g, b;

void setup() {
  setupAudio();
  size(310,300);
  smooth();
}

void draw() {
  drawButton();
  drawChameleon();
}

void loopChameleon() {
  
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
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
  fill(255, 255, 255);
  strokeWeight(2);
  if (isTheMouseOverTheButton()==1) {
    fill(r, g, b);
    if (mousePressed) {
      background(r, g, b);
    }
  }
  else {
    fill(255, 255, 255);
  }
  ellipse (buttonX, buttonY, 2*buttonRadius, 2*buttonRadius);
}

//draws a chameleon
void drawChameleon () {
  
  smooth();
  fill(0, 0, 0); //here you need to change fill!
  stroke(0, 0, 0); //here you need to change fill!
  
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
  float heightOfEyelid = constrain(23-(Y/10), 0, 23);
  rect (55, 95, 30, heightOfEyelid);
}




