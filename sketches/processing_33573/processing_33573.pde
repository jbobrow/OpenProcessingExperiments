
//with help from scott peterman

float eyeWidth = 75;
float eyeRadius = .3*eyeWidth;



void setup(){
size (500, 400);
smooth();
noStroke();
}

void draw(){
  background(0);
  fill(255);
  smooth();
  ellipse(166, 166, eyeWidth, eyeWidth);
  ellipse(334, 166, eyeWidth, eyeWidth);
  animateEyes();
  
}
//pupils
void animateEyes(){
  fill(0);
  noStroke();
  float leftAngle=atan2(mouseY-166, mouseX-166);
  float leftX=cos(leftAngle)*eyeRadius;
  float leftY=sin(leftAngle)*eyeRadius;
  ellipse(leftX+166, leftY+166, 30, 30);
  float rightAngle=atan2(mouseY-166, mouseX-166);
  float rightX=cos(rightAngle)*eyeRadius;
  float rightY=sin(rightAngle)*eyeRadius;
  ellipse(rightX+334, rightY+166, 30, 30);
}
                
