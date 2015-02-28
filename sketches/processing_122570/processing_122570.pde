
float innerR=65;
float gearWheelInnerR=85;
float gearWheelOuterR=100;

float centerX,centerY;
void setup() {
  ellipseMode(RADIUS);
    size(300, 300);
    stroke(0);
    background(255);
    noFill();
    smooth();
    centerX = width/2;
    centerY = height/2;
}

void draw() {

  boolean outerFlag = false;
  beginShape();
  for(int i = 0; i < 360; i += 10){
    float r = outerFlag ? gearWheelOuterR : gearWheelInnerR;
    float x = cos(radians(i)) * r + centerX;
    float y = sin(radians(i)) * r + centerY;
    vertex(x, y);
    r = outerFlag ? gearWheelInnerR : gearWheelOuterR;
    x = cos(radians(i)) * r + centerX;
    y = sin(radians(i)) * r + centerY;
    vertex(x, y);
    outerFlag = !outerFlag;
  }
  endShape(CLOSE);
  
  ellipse(centerX, centerY, innerR, innerR);
}


