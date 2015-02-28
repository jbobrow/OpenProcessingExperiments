
float boxRotation = 0;
float x = 0;
int moveSize = 16;
int tableSize = 8192;
int SR = 60;
int numBoxes = 3;

Box myBox;
Box[] boxes;
Box[] delayedBoxes;

Oscil colorSine;
Oscil[] oscilsX;
Oscil[] oscilsY;
Oscil[] delayedOscilsX;
Oscil[] delayedOscilsY;

Delay[] oscilDelayX;
Delay[] oscilDelayY;

void setup() {
  size(480,800);
  
  smooth();
  rectMode(CENTER);
  
  myBox = new Box(150, 150, 75, 75, color(127, 0, 0));
  
  oscilDelayX = new Delay[numBoxes];
  oscilDelayY = new Delay[numBoxes];
  
  float[] tableSquare = {1, 0, .3333, 0, .111111, 0, .09090909};
  float[] tableSine = {1};
  float[] tableTriangle = {1, .5, .33333, .25, .111111, .1, .09090909};

  colorSine = new Oscil(.25, 127, tableSine);
  
  oscilsX = new Oscil[numBoxes];
  oscilsY = new Oscil[numBoxes];
  delayedOscilsX = new Oscil[numBoxes];
  delayedOscilsY = new Oscil[numBoxes];
  for(int i = 0; i < numBoxes; i++) {
    float rand1 = random(0.1, 2.0);
    float rand2 = random(50, 125);
    oscilsX[i] = new Oscil(rand1, rand2, tableSine);
    delayedOscilsX[i] = new Oscil(rand1, rand2, tableSine);
    
    rand1 = random(0.1, 2.0);
    rand2 = random(100, 200);
    oscilsY[i] = new Oscil(rand1, rand2, tableSine);
    delayedOscilsY[i] = new Oscil(rand1, rand2, tableSine);
  }
  
  boxes = new Box[numBoxes];
  delayedBoxes = new Box[numBoxes];
  for(int i = 0; i < numBoxes; i++) {
    float rand1 = random(50, width - 50);
    float rand2 = random(100, height - 100);
    float rand3 = random(256);
    float rand4 = random(256);
    float rand5 = random(256);
    boxes[i] = new Box(int(rand1), int(rand2), 50, 50, color(int(rand3), int(rand4), int(rand5), 255));
    delayedBoxes[i] = new Box(int(rand1), int(rand2), 50, 50, color(int(rand3), int(rand4), int(rand5), 127));
    oscilDelayX[i] = new Delay(4);
    oscilDelayY[i] = new Delay(4);
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
    
    oscilDelayX[i].process(oscilsX[i].output);
    oscilDelayY[i].process(oscilsY[i].output);
    
    delayedBoxes[i].bDraw();
    delayedBoxes[i].x = boxes[i].startingX + (int)oscilDelayX[i].output;
    delayedBoxes[i].y = boxes[i].startingY + (int)oscilDelayY[i].output;
    delayedBoxes[i].bRotation = myBox.bRotation;
  }
};

void mousePressed() {
  myBox.moving = true;
  myBox.movingStartFlag = false;
}


class Delay {
  float[] table;
  int index;
  float output;
  float time;
  boolean initFlag;
  
  Delay(float tempTime) {
    initFlag = false;
    time = tempTime;
    index = 0;
  }
  
  void process(float input) {
    if(!initFlag) {
      initFlag = true;
      table = new float[(int)time];
      
      for (int i = 0; i < time; i++) {
        table[i] = 0;
      }
    }
    
    index++;
    if(index > time - 1) index = 0;
    table[index] = input;
    if(index < time - 1) output = table[index + 1];
    else output = table[0];
  }
};


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
