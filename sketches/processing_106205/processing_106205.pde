
float breath = 0;
float breathRadius = 0;
float factor = 1;
float move = 1;
boolean pulse = true;
int max = 10;
int makeDouble = 1;


// Amount of Points
int amount =5;


void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  background(255);
  
  if (pulse) {
    breath += factor;
    breathRadius += factor/2;
    if (breath == 0) {
      makeDouble = (int) random(1, 3);
    }
    if (breath > max) {
      pulse = false;
    }
  } else if (pulse == false) {
    breath -= factor;
    breathRadius -= factor/2;
    if (breath < -max) {
      pulse = true;
      //factor = random(1, 1.4);
      max = (int) random(10, 20);
    }
  }

  translate(width/2, height/2);
  rotate(move);
  fill(33);
  bezierEllipse(amount*makeDouble, 100+breathRadius, breath); 
  move += breath/4000;
}

void bezierEllipse(int pts, float radius, float cRadius) {
  beginShape();
  float cx1 = 0;
  float cy1 = 0;
  float cx2 = 0;
  float cy2 = 0;
  float ax = 0;
  float ay = 0;
  float rot = TWO_PI/pts;
  float theta = 0;
  float controlTheta1 = rot/3.0;
  float controlTheta2 = controlTheta1*2.0;
  float controlRadius = radius/cos(controlTheta1)+cRadius;
  
  for (int i=0; i<pts; i++) {
    cx1 = cos(theta + controlTheta1)*controlRadius;
    cy1 = sin(theta + controlTheta1)*controlRadius;
    cx2 = cos(theta + controlTheta2)*controlRadius;
    cy2 = sin(theta + controlTheta2)*controlRadius;
    ax = cos(theta+rot)*radius;
    ay = sin(theta+rot)*radius;
    if (i==0) {
      vertex(cos(0)*radius, sin(0)*radius);
    }

    if (i==pts-1) {
      bezierVertex(cx1, cy1, cx2, cy2, cos(0)*radius,
      sin(0)*radius);
    }

    else {
      bezierVertex(cx1, cy1, cx2, cy2, ax, ay);
    }
    theta += rot;
  }
  noStroke();
  endShape();
}
