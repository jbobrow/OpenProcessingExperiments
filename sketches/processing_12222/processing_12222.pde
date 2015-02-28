
Zoog zoog;
int w = 60;
int h = 60;
int eyeSize =16;

void setup() {
  size(400,400);
  smooth();
  zoog = new Zoog(100,125,60,60,16);
}

int y = height/2;

void draw () {
  for (int x=80; x < width; x+= 80) {
    background(255);
    float factor = constrain(mouseX/10,0,5);
    zoog.jiggleZoog(factor);
    zoog.display();
  }
}

class Zoog {
  float x,y,w,h,eyeSize,eyeR,eyeG,eyeB;
  Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
  }

  //move zoog
  void jiggleZoog(float speed) {
  x = x + random(-1,1)*speed;
  y = y + random(-1,1)*speed;
  x = constrain(x,0,width);
  y = constrain(y,0,height);
  }

  void display() { 
    ellipseMode(CENTER);
    rectMode(CENTER);
    //Looped arms
    for (float i = y+5; i < y + h; i+=10) {
    stroke(0);
    line(x-w/3,i,x+w/3,i);
    }
    //body
    stroke(0);
    fill(150);
    rect(x,y,w/6,h*2);
    //head
    stroke(0);
    fill(255);
    ellipse(x,y-h/2,w,h);
    //eyes
    eyeR = random(255);
    eyeG = random(255);
    eyeB = random(255);
    fill (eyeR,eyeG,eyeB);
    ellipse (x-w/3,y-h/2,eyeSize,eyeSize*2);
    ellipse (x+w/3,y-h/2,eyeSize,eyeSize*2);
    //Legs
    stroke(150);
    line(x-w/12,y+h,x-w/4,y+h+10);
    line(x+w/12,y+h,x+w/4,y+h+10);
  }
}

