
int MARGIN=50;
Clock myClock= new Clock();
String[] number= {  "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};
float xstart, xnoise, ystart, ynoise;

void setup() {
  size(500, 500);
  smooth();
  frameRate(30);

  xstart = random(10);
  ystart = random(10);
}

void draw() {
  //background(255);
  myClock.getTime();
  myClock.draw();
}

class Clock {
  float s, m, h, d;
  Clock() {

  }

  void getTime() {
    
    s = second();
    m = minute() + (s/60.0);
    h = hour()%12 + (m/60.0);
    d = month();
  }

  void draw() {
    background(0, 100, 255);
    xstart += 0.01;   
    ystart = 0.01;    
    xnoise = xstart;
    ynoise = ystart;  
    for (int y = 0; y <= height; y+=5) {
      ynoise += 0.1;
      xnoise = xstart;
      for (int x = 0; x <= width; x+=5) {
        xnoise += 0.1;
        drawPoint(x, y, noise(xnoise, ynoise));
      }
    } 

    float nomalweight=(width/2-MARGIN)/12;
    float secondline=nomalweight*11;
    float miniteline=nomalweight*19/2;
    float hourline=nomalweight*15/2;
    float dayline=nomalweight*6;
    translate(width/2, height/2);
    rotate(radians(180));
    pushMatrix();
    fill(0, 240);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(0, 0, width/2-MARGIN, width/2-MARGIN);

    for (int i=0; i<60; i++) {
      rotate(radians(6));
      ellipse(width/2-MARGIN, 0, 3, 3);
    }
    textSize(40);
    textAlign(CENTER);
    PFont aaa = createFont("Calisto MT Bold Italic", 40);
    textFont(aaa);

    for (int i=0; i<12; i++) {
      rotate(radians(30));
      pushMatrix();
      translate(0, (width/2-MARGIN));
      rotate(radians(180));
      text(number[i], 0, 0);
      translate(width/2, height/2);
      popMatrix();
    }

    strokeCap(SQUARE);
    popMatrix();
    noFill();

    stroke(60, 0, 255, 170);
    pushMatrix();
    // rotate(radians(d*(360/12)));
    strokeWeight(2*nomalweight);
    rainbowshape(60, 0, 255, dayline);
    // creon(dayline,nomalweight,60,0,255,8);
    popMatrix();

    stroke(0, 153, 0, 170);
    pushMatrix();
    rotate(radians(h*(360/12)));
    strokeWeight(3*nomalweight);
    rainbowshape(0, 153, 0, hourline);
    creon(hourline, 3*nomalweight/2, 0, 153, 0, 6);
    popMatrix();

    stroke(255, 220, 0, 170);
    pushMatrix();
    rotate(radians(m*(360/60)));
    strokeWeight(3*nomalweight);
    rainbowshape(255, 220, 0, miniteline);
    creon(miniteline, 3*nomalweight/2, 255, 220, 0, 4);
    popMatrix();

    stroke(255, 0, 0, 170);
    pushMatrix();
    rotate(radians(s*(360.0/60.0)));
    strokeWeight(2*nomalweight);
    rainbowshape(255, 0, 0, secondline);
    creon(secondline, nomalweight, 255, 0, 0, 2);
    popMatrix();
  }
}

void rainbowshape(int R, int G, int B, float whereline) {
  stroke(R, G, B, 10);
  strokeCap(SQUARE);
  for (float i=0;i<30;i++) {
    arc(0, 0, whereline, whereline, PI/60*i, PI/2);
  }
}

void creon(float linelength, float weight, int R, int G, int B, int pensize) {
  fill(R, G, B, 240);
  strokeWeight(1);
  noStroke();
  beginShape();
  vertex(-2, linelength+weight);
  vertex(2, linelength+weight);
  vertex(2+pensize, linelength-weight);
  vertex(2+pensize, 0);
  vertex(-2-pensize, 0);
  vertex(-2-pensize, linelength-weight);
  endShape(CLOSE);
  noFill();
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  noStroke();
  float edgeSize = noiseFactor * 35;
  float grey = 170 + (noiseFactor * 120);
  float alph = 10 +  (noiseFactor * 120);
  fill(grey, alph);
  ellipse(0, 0, edgeSize/4, edgeSize/4);
  popMatrix();
}

