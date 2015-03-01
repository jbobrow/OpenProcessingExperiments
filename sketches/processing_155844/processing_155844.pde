
float headSize;
float earWidth;
float earHeight;
float eyeSize;
float headPosX;
float headPosY;
float leftEarPosX;
float leftEarPosY;
float rightEarPosX;
float rightEarPosY;
float leftEyePosX;
float leftEyePosY;
float rightEyePosX;
float rightEyePosY;
float rectWidth;
float rectHeight;
//color
//color

void setup() {
  size(800, 800);
  background(0);
  headSize = 100;
  earWidth = headSize / 5;
  earHeight = headSize * (.9);
  eyeSize = headSize / 11;
  rectWidth = 100;
  rectHeight = 60;
}

void draw() {
  background(0);

//first set of tiles  
  fill(mouseY-mouseX/180,mouseY/3,mouseX/3, 200);
  rect(50, 500, rectWidth , rectHeight);
  rect(50 + rectWidth, 500+rectHeight, rectWidth, rectHeight);
  rect(50 + rectWidth * 2, 500, rectWidth, rectHeight);
  rect(50 + rectWidth * 3, 500+rectHeight, rectWidth, rectHeight);
  rect(50 + rectWidth * 4, 500, rectWidth, rectHeight);
  rect(50 + rectWidth * 5, 500+rectHeight, rectWidth, rectHeight);
  rect(50 + rectWidth * 6, 500, rectWidth, rectHeight);

//alternating color set of tiles
  fill(mouseY-200,mouseY-200,mouseX-200);
  rect(50 + rectWidth, 480, rectWidth, rectHeight);
  rect(50 + rectWidth * 2, 520+rectHeight, rectWidth, rectHeight);
  rect(50 + rectWidth * 4, 520+rectHeight, rectWidth, rectHeight);
  rect(50 + rectWidth * 5, 480, rectWidth, rectHeight);

//final set of tiles  
  fill(mouseY*.6,mouseX*.3,mouseX*.2, 180);
  rect(50, 520+rectHeight, rectWidth , rectHeight);
  rect(50 + rectWidth * 3, 480, rectWidth, rectHeight);
  rect(50 + rectWidth * 6, 520+rectHeight, rectWidth, rectHeight);

//body
  fill(mouseY/2,mouseX/2,mouseY+mouseX/300);
  noStroke();
  ellipse(400,473,80,120);
  ellipse(380,524,25,90);
  ellipse(421,524,25,90);
  
//head and ears unit
  fill(mouseX/2,mouseY/2,mouseY+mouseX/1000);
  noStroke();
//head
  headPosX = 400;
  headPosY = 400;
  ellipse(headPosX,headPosY+mouseY*.01,headSize,headSize);
//left ear
  ellipse(headPosX-30,350+mouseY*.03,earWidth,earHeight);
//right ear
  ellipse(headPosX+30,350+mouseY*.03,earWidth,earHeight);
//eyes
  eyeSize = 9;
  fill(0);
  ellipse(382, 397+mouseY*.02, eyeSize, eyeSize-mouseY*.01);
  ellipse(418, 397+mouseY*.02, eyeSize, eyeSize-mouseY*.01);
//hands
  fill(mouseX/3,mouseY/3,mouseY+mouseX/700);
  ellipse(320+mouseX*.2,480-mouseY*.2,15,15);
  ellipse(490-mouseX*.2,399+mouseY*.2,18,18);
  
//scren capture
if(keyPressed) {
     if(key == 's') {
       saveFrame();
     }
  }
}


