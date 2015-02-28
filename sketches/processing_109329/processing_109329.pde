
import processing.pdf.*;

PVector gridUnit = new PVector(0, 0);
float gridDensity;
ArrayList sentences = new ArrayList<Sentence>();
float shading = 1.0;

void setup() {
  size(550,850, PDF, "wallpaperprint.pdf");
  generatePage(80.0);
  smooth();
  background(0);
  randomSeed(11);
  noiseSeed(11);
  noFill();
}

float refreshDensity(float density, float theta) {

  float amt = map(abs(tan(theta) * cos(theta)), 0, 1, .4, .7);
  gridUnit.x = displayWidth/gridDensity * amt;
  gridUnit.y = (displayHeight/gridDensity)*.2;
  return gridDensity*amt;
}

void draw() {
  while(shading > 0) {
    for (int i = 0; i < sentences.size(); i++) {      
      Sentence s = (Sentence)sentences.get(i);
      s.drawLetters();
    }
    shading -= .1;
  }
  exit();
}

void mousePressed() {
  saveFrame(millis() + ".png");
}

void generatePage(float density) {
  gridDensity = density;
  sentences.clear();
  int lastH;
  int count = 0; 
  for (int y = int(-height*.1); y <= int(height); y += gridUnit.y) {
    float theta = map(y, 0, height, 0, PI);
    sentences.add(new Sentence(int(refreshDensity(gridDensity, theta)), y, count));
    count++;
  }
}

class Sentence {
  int sentenceNumber; 
  int numLetters; 
  int topY;
  ArrayList letters = new ArrayList<Letter>();

  Sentence(int _numLetters, int _topY, int _sentenceNumber) {

    sentenceNumber = _sentenceNumber; 

    numLetters = _numLetters; 
    topY = _topY;

    int i = ceil(random(4));

    float lastH = random(gridUnit.y);

    for (int x = 0; x <= width; x += gridUnit.x) {

      float droop = map(x%200, 0, 199, 0, 70);
      float newH = random(gridUnit.y+droop);

      i = ((i + 1) % 4) + 1;
      letters.add(new Letter(i, new PVector(x, topY+lastH), 
      new PVector(x+gridUnit.x+(x%5), topY+newH), sentenceNumber));

      lastH = newH;
    }
  }

  void drawLetters() {
    for (int i = 0; i < letters.size(); i++) {
      Letter l = (Letter)letters.get(i);
      l.drawMe();
    }
  }
}

class Letter {
  //0 1 2 3 4 
  int type;
  PVector start, end;
  PVector midPoint = new PVector(0, 0);
  float controlLow = .90, controlHigh = 1;
  int sentenceNumber = 0;


  Letter(int _type, PVector _start, PVector _end, int _sentenceNumber) {
    sentenceNumber = _sentenceNumber;
    start = _start; 
    end = _end;
    type = _type; 

    midPoint.x = (start.x + end.x) / 2;
    midPoint.y = (end.y + end.y) / 2;
  }

  void drawMe() {



    float weight = 10;
    float dist = map(start.y, 0.0, height, 0, TWO_PI);
    float thickVary = abs(cos(dist*10));

    strokeWeight((abs(shading) * weight) * thickVary);

    float alpha = map(gridDensity, 100, 800, 255, 10);

    stroke(255*(1-shading) * (sentenceNumber % 2), 70);

    float theta = map(shading, 1, 0, 0, TWO_PI);

    controlLow += sin(theta)*.001; 
    controlHigh -= sin(theta)*.001;

    float offset = (sentenceNumber % 2 == 0 ? 1 : 0);
    fill(0, 255 * (1-(sentenceNumber % 2)));

    switch(type) {
    case 1:
      curve(midPoint.x*controlLow + offset, midPoint.y*controlHigh + offset, start.x + offset, start.y + offset, end.x + offset, end.y + offset, midPoint.x*controlHigh + offset, midPoint.y*controlLow + offset);
      break;

    case 2:
      rect(start.x + offset, start.y + offset, gridUnit.x, gridUnit.x);
      break;


    case 3:
      break;

    case 4: 
      curve(midPoint.x*controlLow + offset, midPoint.y*controlHigh + offset, start.x + offset, start.y + offset, end.x + offset, end.y + offset, midPoint.x*controlHigh + offset, midPoint.y*controlLow + offset);
      break;
    }
  }
}



