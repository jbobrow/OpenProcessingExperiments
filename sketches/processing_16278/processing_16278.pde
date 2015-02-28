
float boxRotation = 0;
float x = 0;
int moveSize = 16;
int tableSize = 8192;
int SR = 60;
int numBoxes = 15;

Box myBox;
Box[] boxes;

Oscil colorSine;
Oscil[] oscilsX;
Oscil[] oscilsY;

void setup() {
  size(480,800);
  
  smooth();
  rectMode(CENTER);
  
  myBox = new Box(150, 150, 75, 75, color(127, 0, 0));
  
  float[] tableSquare = {1, 0, .3333, 0, .111111, 0, .09090909};
  float[] tableSine = {1};
  float[] tableTriangle = {1, .5, .33333, .25, .111111, .1, .09090909};

  colorSine = new Oscil(.25, 127, tableSine);
  
  oscilsX = new Oscil[numBoxes];
  oscilsY = new Oscil[numBoxes];
  for(int i = 0; i < numBoxes; i++) {
    oscilsX[i] = new Oscil(random(0.1, 2.0), random(100, 200), tableSine);
    oscilsY[i] = new Oscil(random(0.1, 2.0), random(100, 300), tableSine);
  }
  
  boxes = new Box[numBoxes];
  for(int i = 0; i < numBoxes; i++) {
    boxes[i] = new Box(int(random(0, width)), int(random(0, height)), 50, 50, color(int(random(256)), int(random(256)), int(random(256))));
  }
  
  frameRate(SR);
};

void draw() {
  background(color(127 + colorSine.output, 127 + colorSine.output, 127 + colorSine.output));
  myBox.bRotation += .1;
  if(myBox.bRotation > 2*PI) myBox.bRotation -= (2*PI);
  
  colorSine.process();
  
  myBox.bDraw();
  if(myBox.moving) myBox.moveToPoint(mouseX, mouseY);
  
  for(int i = 0; i < numBoxes; i++) {
    oscilsX[i].process();
    oscilsY[i].process();
    
    boxes[i].bDraw();
    boxes[i].x = boxes[i].startingX + (int)oscilsX[i].output;
    boxes[i].y = boxes[i].startingY + (int)oscilsY[i].output;
    boxes[i].bRotation = myBox.bRotation;
  }
};

void mousePressed() {
  myBox.moving = true;
  myBox.movingStartFlag = false;
}


class Table {
  float[] tTable;
  
  Table(float[] amps) {
    float tMax = 0;
    tTable = new float[tableSize];
    
    for(int i = 0; i < tableSize; i++) {
      tTable[i] = 0;
      for(int j = 0; j < amps.length; j++) {
        tTable[i] += (sin((2.0*PI*i / (float)tableSize)*(j+1))) * amps[j];
      }
      if(abs(tTable[i]) > tMax) tMax = abs(tTable[i]);
    }
    
    for(int i = 0; i < tableSize; i++)
      tTable[i] /= tMax;
  }
};


class Oscil {
  float index;
  float increment;
  float freq;
  float amp;
  Table table;
  float output;
  
  Oscil(float tempFreq, float tempAmp, float[] amps) {
    freq = tempFreq;
    amp = tempAmp;
    index = 0;
    increment = freq * tableSize / SR;
    table = new Table(amps);
  }
  
  void process() {
    output = table.tTable[(int)index] * amp;
    index += increment;
    if(index >= tableSize) index -= tableSize;
  }
};

class Box {
  int x;
  int y;
  int startingX;
  int startingY;
  int bWidth;
  int bHeight;
  float bRotation;
  color bColor;
  boolean moving;
  boolean movingStartFlag;
  float movingIncrementX;
  float movingIncrementY;
  int movingCounter;
  
  Box(int tempX, int tempY, int tempBWidth, int tempBHeight, color tempBColor) {
    bRotation = 0;
    moving = false;
    x = tempX;
    y = tempY;
    startingX = x;
    startingY = y;
    bWidth = tempBWidth;
    bHeight = tempBHeight;
    bColor = tempBColor;
    fill(bColor);
    stroke(bColor);
    rect(x, y, bWidth, bHeight);
  }
  
  void bDraw() {
    pushMatrix();
      translate(x, y);
      rotate(bRotation);
      fill(bColor);
      stroke(bColor);
      rect(0, 0, bWidth, bHeight);
    popMatrix();
  }
  
  void moveToPoint(int tempX, int tempY) {
    if(!movingStartFlag) {
      movingIncrementX = (float)((tempX - x) / moveSize);
      movingIncrementY = (float)((tempY - y) / moveSize);
      movingStartFlag = true;
      movingCounter = 0;
    }
    movingCounter++;
    if(movingCounter > moveSize) {
      moving = false;
      movingStartFlag = false;
    }
    x += movingIncrementX;
    y += movingIncrementY;
  }
};
