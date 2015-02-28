
/* assignment following eyes - square version */

float  xPos;
float  yPos;
float  px;
float  py;
float ellipsePosY = 200;
float radius = 25.0;
int eyeRadius = 20;



void setup() {
  size(600, 400);
  smooth();
  frameRate(10);
}



void draw() {


  background(0);

  for (int i = 0; i < 2; i ++) {  //drawing of the white part of the eyes

    fill(255, 255, 255);

    rect(100*i + 225, 225, 2*radius, 2* radius);
  }
  
  
  xPos = constrain(mouseX, 250 - radius, 250 + radius);
  
  yPos = constrain(mouseY, 250 - radius, 250 + radius);
  
      fill(15,255,0);
  ellipse(xPos, yPos, eyeRadius, eyeRadius); 

  
      fill(15,255,0);
    ellipse(xPos + 100, yPos, eyeRadius, eyeRadius);  
}

