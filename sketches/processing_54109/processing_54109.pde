
void setup() {
  size(800, 800); 
  smooth();
  noLoop();
}

void draw() {
  drawRobot(random(50, width-100), 
            random(50, height-200), 
            random(10, 30), 
            random(10, 30), 
            random(70, 150), 
            random(70, 150), 
            random(-100, 100),
            random(-100, -50),
            color(random(0, 255), random(0, 255), random(0, 255)));
}


void drawRobot(float x, float y, float eyeLeft, float eyeRight, float armLengthRight, float armLengthLeft, float dirX, float dirY, color c) {
  pushMatrix();
  translate(x, y);
  fill(c);
  ellipse(0, 0, 100, 100);

  
  pushMatrix();
  translate(-90, 50);
  rotate(radians(40));
  rect(40, -30, 30, armLengthLeft);
  popMatrix();
  pushMatrix();
  translate(50, 50);
  rotate(radians(-40));
  rect(-40, -5, 30, armLengthRight);
  popMatrix();
  rect(-50, 50, 100, 150);
  rect(-50, 200, 50, 100);
  rect(0, 200, 50, 100);

  noFill();
  beginShape();
  curveVertex(0, 0);
  curveVertex(0, -50);
  curveVertex(15, -90);
  curveVertex(dirX, dirY);
  curveVertex(0, -100);
  endShape(); 

  fill(c);
  ellipse(dirX, dirY, 10, 10);
  ellipse(-20, -10, eyeLeft, eyeLeft);
  ellipse(20, -10, eyeRight, eyeRight);
  rect(-10, 20, 20, 20); 
  popMatrix();
}

void mousePressed() {
 redraw(); 
}

