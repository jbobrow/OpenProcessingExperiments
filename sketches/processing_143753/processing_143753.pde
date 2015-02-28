
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hong Jiyae 
// ID: 201420117 

float angle;

void setup() {
  size(666, 666);
  smooth();
  // noLoop();
}
void draw() {
  noStroke();
  fill(0,10);
  rectMode(LEFT);
  rect(0,0,width,height);
  
  translate(width/2, height/2);
  
  for (int i = 0; i < 50; i = i + 2) {
      rotate(radians(angle)); 
      scale(0.85);
      pushMatrix();
        // Sattelites 1
        pushMatrix();
        translate(230,230);
        fill(255);
        ellipse(0, 0, 20,20);
        for (int j = 0; j < 20; j = j + 1) {
          rotate(radians(-angle*5)); 
          scale(0.85);
          noStroke();
          fill(255,100);
          ellipse(100,100,30,30);
        }
        popMatrix();
        // Sattelites 2
        pushMatrix();
        translate(-230, 230);
        fill(255);
        ellipse(0, 0, 20,20);
        for (int j = 0; j < 20; j = j + 1) {
          rotate(radians(-angle*5)); 
          scale(0.85);
          noStroke();
          fill(255,100);
          ellipse(100,100,30,30);
        }
        popMatrix();
        // Sattelites 3
        pushMatrix();
        translate(230, -230);
        fill(255);
        ellipse(0, 0, 20,20);
        for (int j = 0; j < 20; j = j + 1) {
          rotate(radians(-angle*5)); 
          scale(0.85);
          noStroke();
          fill(255,100);
          ellipse(100,100,30,30);
        }
        popMatrix();
        // Sattelites 4
        pushMatrix();
        translate(-230, -230);
        fill(255);
        ellipse(0, 0, 20,20);
        for (int j = 0; j < 20; j = j + 1) {
          rotate(radians(-angle*5)); 
          scale(0.85);
          noStroke();
          fill(255,100);
          ellipse(100,100,30,30);
        }
        popMatrix();

      popMatrix();
    }
    angle = angle + 0.1;
  }

