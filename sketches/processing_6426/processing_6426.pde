
Boolean button = false;
Circle[] circles = new Circle[500];

void setup() { 
  size(400,400); 
  smooth();
  for (int i=0; i<circles.length; i++) {
    circles[i] = new Circle(random(width), random(height), random(15), random(15, 30), random(-50, 50), random(-50, 50), random(255), random(255), random(255), random(255));
  }
} 

void draw() { 
  background(255);
  for (int i=0; i<circles.length; i++) {
    circles[i].display(); 
  }
} 

class Circle {

  float circleX;
  float circleY;
  float diam;
  float speed;
  float offsetX; 
  float offsetY; 
  float R, G, B, A;
  float offsetXConst, offsetYConst;

  Circle(float tempCircleX, float tempCircleY, float tempDiam, float tempSpeed, float tempOffsetX, float tempOffsetY, float tempR, float tempG, float tempB, float tempA) {
    circleX = tempCircleX;
    circleY = tempCircleY;
    diam = tempDiam;
    speed = tempSpeed;
    offsetX = tempOffsetX;
    offsetY = tempOffsetY;
    R = tempR;
    G = tempG;
    B = tempB;
    A = tempA;
    offsetXConst = offsetX;
    offsetYConst = offsetY;
  }

  void display() {
    noStroke();
    fill(R, G, B, A);
    ellipse(circleX, circleY, diam, diam);
    if (button) {
      circleX += ((mouseX+offsetX)-circleX)/speed;
      circleY += ((mouseY+offsetY)-circleY)/speed; 
    }
    offsetX += random(-2,2); 
    offsetY += random(-2,2);

    if (mouseX-pmouseX != 0) { 
      offsetX += random(0); 
      offsetY += random(0);
      offsetX = constrain(offsetX, 0, offsetXConst); 
      offsetY = constrain(offsetY, 0, offsetYConst);
    }
  }
}

void mousePressed() {
  button = !button;
}



