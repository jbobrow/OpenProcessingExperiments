
PVector position;
PVector velocity;

void setup() {
  size(500, 500); 
  frameRate(25);
  smooth();
  
  position = new PVector(width/2, height/2);
  velocity = new PVector(0, 0);
}

void draw() {
  background(44);

  PVector mouseDirection = new PVector(mouseX, mouseY);
  PVector centerPoint = new PVector(width * 0.5, height * 0.5);
  mouseDirection.sub(centerPoint);
  mouseDirection.mult(0.001);
  
  velocity.add(mouseDirection);
  velocity.limit(5);

  position.add(velocity);

  noStroke();
  fill(255);

  ellipse(position.x, position.y, 20, 20);
  
  /* Draw mouse direction */
  stroke(255, 0, 0);
  line(width/2, height/2, mouseX, mouseY);
  
 
  /* Draw vectors (DO NOT COPY)  */
  stroke(255, 0, 0);
  drawVector(velocity, position, 20);
  stroke(0, 255, 0);
  drawVector(mouseDirection, position, 200);

}

void drawVector(PVector vec, PVector base, float len) {
  pushMatrix();
  float arrowSize = 4;
  translate(base.x, base.y);
  rotate(vec.heading2D());
  float lineLength = vec.mag() * len;
  line(0, 0, lineLength, 0);
  line(lineLength, 0,lineLength - arrowSize, arrowSize * 0.5);
  line(lineLength, 0,lineLength - arrowSize,-arrowSize * 0.5);
  popMatrix();
}



