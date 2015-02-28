
import processing.pdf.*;
boolean record;

int numCircles = int(random(1, 20));
Circle[] myCircles;//define class and array

void setup() {
  size(350, 400);
  smooth();
  frameRate(12);
  myCircles = new Circle[numCircles];
  for (int i = 0; i < numCircles; i++) {
    myCircles[i] = new Circle(random(20, width-50), random(20, height-50), random(10, 20));
  }
}
void draw() {
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");
  }

  background(0);
  for (int i = 0; i < numCircles; i++) {
    myCircles[i].jit();
    myCircles[i].display();
    float alph = dist(width/2, height/2, mouseX, mouseY);
    float maxAlph = dist(0, 0, width/2, height/2);
    float a1 = map(alph, 0, maxAlph, 40, 180);
    stroke(255, 255, 255, a1);
    strokeWeight(0.3);
    for (int j=i+1; j< numCircles; j++) {
      line(myCircles[i].x, myCircles[i].y, myCircles[j].x, myCircles[j].y);
      float mx = constrain(myCircles[i].x, 20, width-20);
      float my = constrain(myCircles[i].y, 20, height-20);
    }
  }
  if (record) {
    endRecord();
    record = false;
  }
}

class Circle {
  float x, y;
  float diameter = random(10, 20);

  Circle(float tempx, float tempy, float tempdiam) {
    x = tempx;
    y = tempy;
    tempdiam = diameter;
  }

  void jit() {
    float d = dist(width/2, height/2, mouseX, mouseY);
    float maxDist = dist(0, 0, width/2, height/2);
    float x1 = map(d, 0, maxDist, 4.00, 0.2);
    x += random(-x1, x1);//make it jitter horizontal
    y += random(-x1, x1);//make it jitter vertical
  }

  void display() {
    noStroke();
    float alph = dist(width/2, height/2, mouseX, mouseY);
    float maxAlph = dist(0, 0, width/2, height/2);
    float a1 = map(alph, 0, maxAlph, 10, 200);
    fill(255, 255, 255, a1);
    ellipseMode(CENTER);
    float mx = constrain(x, 20, width-20);
    float my = constrain(y, 20, height-20);
    ellipse(mx, my, diameter, diameter);
  }
}

void keyPressed() {
  if (key == 's') {
    endRecord();
    record = true;
  }
}

void mousePressed() {
  numCircles = int(random(1, 30));
  setup();
  redraw();
}  



