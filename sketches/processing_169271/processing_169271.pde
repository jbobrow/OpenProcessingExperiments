
float eyeSize = 20; 
float faceWidth = 100; 
float faceHeight = 150; 
float controlY = 250; 
float r = 0;
float g = 100;
float b = 255;
float thickness = 2;
float bgFill = 180;

void setup(){
  size(500,500); 
}
 
void draw(){
  background(bgFill);
  strokeWeight(thickness);
  fill(r, g, b);
  ellipse (width/2, height/2, faceWidth, faceHeight); 
 
  fill(0);
  float eyeLX = width/2 - faceWidth*0.25;
  float eyeRX = width/2 + faceWidth*0.25;
  ellipse (eyeLX, height/2, eyeSize, eyeSize); 
  ellipse (eyeRX, height/2, eyeSize, eyeSize); 
  bezier(eyeLX, height*.6, 200, controlY, 300, controlY, eyeRX, height*.6);
}
 
void mousePressed(){
  faceWidth  = random (110,  450); 
  faceHeight = random (100, 450); 
  eyeSize    = random (10,  40); 
  controlY = random (250, 350);
  r = random (0, 255);
  g = random (0, 255);
  b = random (0, 255);
  thickness = random (1, 8);
  bgFill = random(10, 255);
}
