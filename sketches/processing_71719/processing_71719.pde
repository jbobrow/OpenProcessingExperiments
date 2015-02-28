
// woo hoo ambiguous species!

float eyeSize = 30; 
float whiskerLength = 40;
float earX = 70;
float earY = 70;
float faceX = 50;
float faceY = 50;
float mouthSize = 30;
float R = 255;
float G = 255;
float B = 255;
PImage space;

void setup(){
  size (500, 500);
  background (184, 59, 34);
  space = loadImage("http://i49.tinypic.com/2rpfsyf.jpg");
}
 
void draw() {
  image(space, 0, 0);
  
  //face
  smooth();
  fill(R, G, B);
  beginShape();
  vertex (250, 150);
  bezierVertex(400, 150, 400, 380, 300, 400);
  bezierVertex(260, 430, 230, 430, 200, 400);
  bezierVertex(100, 400, 80, 150, 250, 150);
  endShape();
  
  // eyes
  fill(17, 16, 18);
  ellipse(190, 320, eyeSize, eyeSize);
  ellipse(300, 320, eyeSize, eyeSize);
  
  // whiskers
  line(300, 360, 300+whiskerLength, 350); // R
  line(298, 368, 298+whiskerLength, 380); // R
  line(190, 360, 190-whiskerLength, 350); // L
  line(192, 368, 192-whiskerLength, 380); // L
  
  // right ear
  beginShape();
  curveVertex(300, 220);
  curveVertex(300, 170); // ear starts at top of head
  curveVertex(300+earX, 100+earY); // top tip of right ear
  curveVertex(300+earX*1.5, 100+earY*1.5); // curve at bottom of ear
  curveVertex(300+earX*.6, 170+earY*1.6); // ending point
  curveVertex(400, 250);
  endShape();
  
  // left ear
  beginShape();
  curveVertex(100, 220);
  curveVertex(200, 170); // ear starts at top of head
  curveVertex(200-earX, 100+earY); // top tip of right ear
  curveVertex(200-earX*1.5, 100+earY*1.5); // curve at bottom of ear
  curveVertex(200-earX*.6, 170+earY*1.6); // ending point
  curveVertex(100, 250);
  endShape();
 
  // nose 
  fill(235, 136, 171);
  beginShape();
  vertex(250, 350);
  bezierVertex(280, 350, 260, 360, 250, 370); // right half of nose
  bezierVertex(200, 360, 228, 347, 250, 350); // left half of nose
  endShape();
  
  // pupil
  fill (R-100, G-100, B-100);
  ellipse(190, 320+eyeSize/4, eyeSize/2.0, eyeSize/2.0); 
  ellipse(300, 320+eyeSize/4, eyeSize/2.0, eyeSize/2.0); 
  
  
  strokeWeight(3);
  noFill();
  arc((500-mouthSize)/2, 371, mouthSize, mouthSize, 0, PI); // l
  arc((500-mouthSize)/2+mouthSize, 371, mouthSize, mouthSize, 0, PI); // r 
  
}
 
void mousePressed(){
  R = random (150, 255);
  G = random (150, 255);
  B = random (150, 255);  
  faceX = random (200, 250); 
  faceY = random (200, 250);
  earX = random (60, 100);
  earY = random (30, 80);
  eyeSize = random (15,80);
  mouthSize = random (15,65);
  whiskerLength = random (20, 200);
}
