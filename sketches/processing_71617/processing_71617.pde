
float eyeSize = 20; 
float faceWidth = 100; 
float faceHeight = 150; 
float mouth = 15;
float mouthWidth = 10;
float mouthPlace = 30;

float r = 48;
float g = 148;
float b = 60;

float r1 = 255;
float g1 = 205;
float b1 = 3;
 
void setup(){
  size(400,400); 
}
 
void draw(){
  background(r, g, b);
  strokeWeight (1);
  fill (255);
  ellipse (width/2, height/2, faceWidth, faceHeight); 
 
  float eyeLX = width/2 - faceWidth*0.25;
  float eyeRX = width/2 + faceWidth*0.25;
  fill (r1, g1, b1);
  ellipse (eyeLX, height/2, eyeSize, eyeSize); 
  ellipse (eyeRX, height/2, eyeSize, eyeSize); 
  
  strokeWeight (mouth);
  line (width/2-mouthWidth,height/2+mouthPlace, width/2+mouthWidth,height/2+mouthPlace);
}
 
void mousePressed(){
  faceWidth  = random (75,  225); 
  faceHeight = random (100, 275); 
  eyeSize    = random (10,  45); 
  
  //background color
  r = random (0, 255);
  g = random (0, 255);
  b = random (0, 255);
  //eye color
  r1 = random (0, 255);
  g1 = random (0, 255);
  b1 = random (0, 255);
  //mouth
  mouth = random (5, 40);
  mouthWidth = random (5, 25);
  mouthPlace = random (20, 55);
}
