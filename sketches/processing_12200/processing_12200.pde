
Zoog zoog1;
Zoog zoog2;

void setup() {
  size(300,200);
  smooth();
  zoog1 = new Zoog(100,125,60,60,16,random(255),random(255),random(255));
  zoog2 = new Zoog (200,50,30,30,8,random(255),random(255),random(255));
}

void draw() {
  background(255);
  // mouseX position determines speed factor
  float factor = constrain(mouseX/20,0,2);
  zoog1.jiggle(factor);
  zoog1.display();
  zoog2.jiggle(factor);
  zoog2.display();
}

class Zoog {
  // Zoog's variables
  float x,y,w,h,eyeSize,bodyR,bodyG,bodyB;
  
  // Zoog constructor
  Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize, float tempBodyR, float tempBodyG, float tempBodyB) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
    bodyR = tempBodyR;
    bodyG = tempBodyG;
    bodyB = tempBodyB;
  }
  
  // Move Zoog
  void jiggle(float speed) {
    // Change the location of Zoog randomly
    x = x + random(-1,1)*speed;
    y = y + random(-1,1)*speed;
    // Constrain Zoog to window
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  // Display Zoog
  void display() {
    // Set ellipses and rects to CENTER mode
    ellipseMode(CENTER);
    rectMode(CENTER);
    // Draw Zoog's arms with a for loop
    for (float i = y - h/3; i < y + h/2; i += 10) {
      stroke(0);
      line(x-w/4,i,x + w/4,i);
    }
    // Draw Zoog's body
    stroke(0);
    fill(bodyR,bodyG,bodyB);
    rect(x,y,w/6,h);
    // Draw Zoog's head
    stroke(0);
    fill(mouseX,0,mouseY);
    ellipse(x,y-h,w,h);
    // Draw Zoog's eyes
    fill(0);
    ellipse(x-w/3,y-h,eyeSize,eyeSize*2);
    ellipse(x + w/3,y - h,eyeSize,eyeSize*2);
    // Draw Zoog's legs
    stroke(0);
    line(x - w/12,y + h/2,x - w/4,y + h/2 + 10);
    line(x + w/12,y + h/2,x + w/4,y + h/2 + 10);
  }
}

