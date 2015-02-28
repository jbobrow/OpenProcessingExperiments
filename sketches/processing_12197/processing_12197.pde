
Zoog zoog;
Zoog zoog2;

void setup() {
  size(500,500);
  smooth();
  zoog = new Zoog(100,125,60,60,16, color(100,0,100));
  zoog2 = new Zoog(250,250,60,60,16, color(0,255,0));
}

void draw() {
  background(255);
  // mouseX position determines speed factor
  float factor = constrain(mouseX/10,0,5);
  zoog.jiggle(factor);
  zoog.display();
  zoog2.jiggle(factor);
  zoog2.display();
}

class Zoog {
  // Zoog's variables
  float x,y,w,h,eyeSize;
  color eyes;
  
  // Zoog constructor
  Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize, color tempEyes) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
    eyes  = tempEyes;
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
    fill(175);
    rect(x,y,w/6,h);
    // Draw Zoog's head
    stroke(0);
    fill(255);
    ellipse(x,y-h,w,h);
    // Draw Zoog's eyes
    fill(eyes);
    ellipse(x-w/3,y-h,eyeSize,eyeSize*2);
    ellipse(x + w/3,y - h,eyeSize,eyeSize*2);
    // Draw Zoog's legs
    stroke(0);
    line(x - w/12,y + h/2,x - w/4,y + h/2 + 10);
    line(x + w/12,y + h/2,x + w/4,y + h/2 + 10);
  }
}

