
Zoog zoogA;
Zoog zoogB;
Zoog zoogC;
Zoog zoogD;
Zoog zoogE;

void setup() {
  size(500,500);
  smooth();
  zoogA = new Zoog(200,325,100,125,30);
  zoogB = new Zoog(390,200,60,80,16);
  zoogC = new Zoog(440,400,150,50,10);
  zoogD = new Zoog(300,230,100,50,12);
  zoogE = new Zoog(100,140,40,90,15);
}

void draw() {
  background(255);
  float factor = constrain(mouseX/5,mouseY/10,2);
  zoogA.jiggle(factor);
  zoogA.display();
  zoogB.jiggle(factor);
  zoogB.display();
  zoogC.jiggle(factor);
  zoogC.display();
  zoogD.jiggle(factor);
  zoogD.display();
  zoogE.jiggle(factor);
  zoogE.display();
}

// Zoog variables
class Zoog {
  float x,y,w,h,eyeSize;
  
  Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
  }
  
  // Zoog jiggles
  void jiggle(float speed) {
    x = x + random(-1, 1)*speed;
    y = y + random(-1, 1)*speed;
    
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
  // Zoog displays
  void display() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    
    for (float i = y - h/3; i < y + h/2; i +=10) {
      stroke(0);
      line(x - w/4, i, x + w/4, i);
    }
    
  // Zoog body
  stroke(0);
  fill(0, 0, 200);
  rect(x,y,w/6,h);
  
  // Zoog head
  stroke(0);
  fill(0, 200, 0);
  ellipse(x,y-h,w,h);
  
  // Zoog eyes
  fill(random(255));
  ellipse(x-w/3, y-h, eyeSize, eyeSize * 2);
  ellipse(x+w/3, y-h, eyeSize, eyeSize * 2);
  
  // Zoog legs
  stroke(0);
  line(x-w/12, y+h/2, x-w/4, y+h/2+10);
  line(x+w/12, y+h/2, x+w/4, y+h/2+10);
  }
}

