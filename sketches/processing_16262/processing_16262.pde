
float boxRotation = 0;
float x = 0;
int moveSize = 16;
int tableSize = 8192;
int SR = 60;
int numBoxes = 10;

Box myBox;
Box myBox2;
Box[] boxes;
Sine mySine;
Sine sine2;
Sine colorSine;

void setup() {
  size(480,800);
  
  smooth();
  rectMode(CENTER);
  
  myBox = new Box(150, 150, 75, 75, color(127, 0, 0));
  myBox2 = new Box(200, 600, 75, 75, color(0, 127, 0));
  mySine = new Sine(1, 150);
  sine2 = new Sine(.5, 200);
  colorSine = new Sine(.25, 127);
  
  boxes = new Box[numBoxes];
  for(int i = 0; i < numBoxes; i++) {
    boxes[i] = new Box(int(random(300) + 75), int(random(600) + 75), 50, 50, color(int(random(256)), int(random(256)), int(random(256))));
  }
  
  frameRate(SR);
};

void draw() {
  background(color(127 + colorSine.output, 127 + colorSine.output, 127 + colorSine.output));
  myBox.bRotation += .1;
  if(myBox.bRotation > 2*PI) myBox.bRotation -= (2*PI);
  myBox2.bRotation = myBox.bRotation;
  
  mySine.process();
  sine2.process();
  colorSine.process();
  
  myBox2.x = myBox2.startingX + (int)mySine.output;
  myBox2.y = myBox2.startingY + (int)sine2.output;
  
  myBox.bDraw();
  myBox2.bDraw();
  if(myBox.moving) myBox.moveToPoint(mouseX, mouseY);
  
  for(int i = 0; i < numBoxes; i++) {
    boxes[i].bDraw();
    boxes[i].x = boxes[i].startingX + (int)mySine.output;
    boxes[i].y = boxes[i].startingY + (int)sine2.output;
    boxes[i].bRotation = myBox.bRotation;
  }
};

void mousePressed() {
  myBox.moving = true;
  myBox.movingStartFlag = false;
}


class Sine {
  float index;
  float increment;
  float freq;
  float amp;
  float[] table;
  float output;
  
  Sine(float tempFreq, float tempAmp) {
    freq = tempFreq;
    amp = tempAmp;
    index = 0;
    increment = freq * tableSize / SR;
    
    table = new float[tableSize];
    
    for(int i = 0; i < tableSize; i++) {
      table[i] = (sin(2*PI*i / (float)tableSize));
    }
  }
  
  void process() {
    output = table[(int)index] * amp;
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

                
                
