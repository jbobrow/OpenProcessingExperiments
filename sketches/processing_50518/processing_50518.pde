
// Creative Code -- Homework One - Moire Pattern
// Angela Ferraiolo

void setup() {
  size(800,800);
  background(0,200,180);
  smooth();
  strokeWeight(2);
  rectMode(CENTER);
}

void draw() {
  
  // draw positive space figures
  pushMatrix();
  translate(400,400);
  rotate(radians(frameCount));
  drawFigure();
  popMatrix();
  
  pushMatrix();
  translate(400,400);
  rotate(radians(frameCount*2));
  drawFigure();
  popMatrix();
  
  // draw negative space figure
  pushMatrix();
  translate(400,400);
  rotate(-frameCount);
  eraseFigure();
  popMatrix();
  
  // reset every 60 seconds
  if (frameCount%1800 == 0) {
    background(0,200,180);
  }
}

void mouseClicked() {
  
  // reset if mouse clicked
  background(0,200,180);
}

void drawFigure() {
  stroke(150,10,20);
  noFill();
  rect(0,0,800,100);
}

void eraseFigure() {
  stroke(0,200,180);
  noFill();
  rect(0,0,100,800);
}


