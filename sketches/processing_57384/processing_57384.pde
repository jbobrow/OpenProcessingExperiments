
Robot robot;

int x = 0;
int y = 0;
int speed = 3;
float l = 60;
float m =440;
int radius = 45;
int neckHeight = 50;
int headHeight = 100;
float easing = 0.02;

void setup() {
  size (700, 480);
  smooth();
  strokeWeight(2);
  background(200);
  ellipseMode (RADIUS);
  robot = new Robot (100, 125, 60, 60, 16);
}

void draw() {
  background (255);
  float factor = constrain (mouseX/10, 0, 5);
  robot.jiggle(factor);
  robot.display();
}

class Robot {
  float x, y, w, h, eyeSize;
  Robot (float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
  }
  
  void jiggle (float speed) {
    x = x + random (-1, 1)*speed;
    y = y + random (-1,1)*speed;
    
    x = constrain (x, 0, width);
    y = constrain (y, 0, height);
  }
  
  void display() {
    ellipseMode (CENTER);
    rectMode (CENTER);
    //Head
    fill(128);
    rect(x+90, headHeight+60, 100, 120);
    fill(0);
    ellipse(x+60, headHeight+50, 20, 20);
    ellipse(x+100, headHeight+50, 20, 20);
    line(x+40, headHeight, x+10, headHeight-40);
    line(x+140, headHeight, x+160, headHeight-40);
    fill(0);
    arc(x+90, headHeight+70, 80, 50, radians(0), radians(180));
    
    //Neck
    fill(255);
    rect(x+60, headHeight+135, 20, neckHeight-20);
    
    //Body
    fill(0);
    rect(x+90, 320, 200, 150);
    
    //Legs
    fill(128);
    rect(x+10, 420, 20, 50);
    rect(x+60, 420, 20, 50);
    rect(x+110, 420, 20, 50);
    rect(x+160, 420, 20, 50);
    
    //Feet
    fill(255);
    ellipse(x+10, 460, 40, 40);
    ellipse(x+60, 460, 40, 40);
    ellipse(x+110, 460, 40, 40);
    ellipse(x+160, 460, 40, 40);
  }
}


