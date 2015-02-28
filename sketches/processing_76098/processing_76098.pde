
/*
float triLineWidth = 200;
int startX = 150;
int stepAmt = 10;
int steps = 70;
*/
float triLineWidth = 125;
int startX = 75;
int stepAmt = 7;
int steps = 70;
float revolutions = 1.346;
float rotateStep = (TWO_PI * revolutions) / (float)steps;

boolean firstRun;

void setup() { 
  size(640, 200, P2D); 
  colorMode(RGB, 1);
  
  background(1);
  
  strokeWeight(1);
  stroke(0.2,0.5,0.56);
  for(int i = 0; i < steps; i++) {
    pushMatrix();
    
    scale(1.0,-1.0);
    
    translate(0.0,-(height - (height / 2.0)));
    
    float curAngle = -rotateStep * i;
    
    translate(startX + (stepAmt * i), 0);
    
    rotate(curAngle);
    
    float right = triLineWidth / 2.0;
    float left = -triLineWidth / 2.0;
    float top = (triLineWidth * sin(PI / 3.0f)) / 1.4;
    float bottom = (-triLineWidth * sin(PI / 3.0f)) / 2.6;
    
    line(left, bottom, right, bottom);
    line(left, bottom, 0, top);
    line(right, bottom, 0, top);
    
    popMatrix();
  }
} 


