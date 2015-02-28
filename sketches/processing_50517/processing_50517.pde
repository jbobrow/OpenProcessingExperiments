
// Creative Code -- Homework One - Moire Pattern
// Angela Ferraiolo

int lineGap = 10;
float speed = 1;

void setup() {
  size(400,400);
  smooth();
  strokeWeight(3);
  rectMode(CENTER);
}

void draw() {
  
  background(255);
  
  // draw inner circles
  pushMatrix();
  translate(200,200);
  rotate(radians(4*frameCount));
  fill(255,0,0);
  ellipse(50,0,10,10);
  ellipse(-50,0,10,10);
  ellipse(0,50,10,10);
  ellipse(0,-50,10,10);
  popMatrix();
  
  // draw outer circles
  pushMatrix();
  translate(200,200);
  rotate(radians(2*frameCount));
  ellipse(200,0,40,40);
  ellipse(-200,0,40,40);
  ellipse(0,200,40,40);
  ellipse(0,-200,40,40);
  popMatrix();
  
  // draw middle circles
  pushMatrix();
  translate(200,200);
  rotate(radians(-frameCount));
  ellipse(100,0,20,20);
  ellipse(-100,0,20,20);
  ellipse(0,100,20,20);
  ellipse(0,-100,20,20);
  popMatrix();
  
  // draw positive figure
  pushMatrix();
  translate(200,200);
  rotate(radians(speed*frameCount));
  drawFigure();
  popMatrix();
  
  // draw negative figure
  pushMatrix();
  translate(200,200);
  rotate(radians(-speed*frameCount));
  eraseFigure();
  popMatrix();
  
}

// set speed based on x position of mouse
void mouseMoved() {
  speed = map(mouseX,0,width,0,2);
}

// black parallel lines
void drawFigure() {
  stroke(0);
  for (int i = -300; i < 300; i = i+lineGap) {
    line(-300, i, 300, i);
  }
}

// white parallel lines
void eraseFigure() {
  stroke(255);
  for (int i = -300; i < 300; i = i+lineGap) {
    line(-300, i, 300, i);
  }
}

