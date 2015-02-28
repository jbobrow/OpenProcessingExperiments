

PVector targetPosition; 

PVector startPosition;
PVector position;
PVector velocity;
 
PVector gravity;
 
float mass = 10;

 
void setup() {
  size(800, 500);
  frameRate(25);
  smooth();
  
  targetPosition = new PVector(600, 300);
   
  startPosition = new PVector(); // (0, 0)
   
  position = new PVector(0, 0);
  velocity = new PVector(0, 0);
  gravity = new PVector(0, 0.4);  // gravity goes down
}
 
void draw() {
  background(44);
 
  /* Calculate the movement */   
  PVector acceleration = new PVector();
  acceleration.add(gravity);
   
  velocity.add(acceleration);
 
  position.add(velocity);
 
 
  /* Draw the object */
  noStroke();
  fill(28, 234, 193);
 
  rect(position.x, position.y, mass, mass);
   
 float distance = position.dist(targetPosition);
 
 
 if(distance < 100) {
    //targetPosition.x = targetPosition.x + 20; 
     fill(166, 72, 183);
   
 
 } else {
   fill(255, 204, 0);
   
 }
    
   
 ellipse(targetPosition.x, targetPosition.y, 20, 20);
 

  /* Draw slingshot */
  if(mousePressed) {
    stroke(166, 72, 183);
    line(mouseX, mouseY, startPosition.x, startPosition.y);
     
    noStroke();
    fill(166, 72, 183);
     
    rectMode(CENTER);
    rect(startPosition.x, startPosition.y, 10, 10);
  }
   
   
  /* Draw vectors */
  stroke(28, 234, 193);
  drawVector(velocity, position, 20);
  stroke(28, 234, 193);
  drawVector(acceleration, position, 200);
}
 
 
void mousePressed() {
  startPosition.set(mouseX, mouseY, 0);
}
 
 
void mouseReleased() {
  position.set(startPosition);   // Begin where we started dragging
   
  PVector mouseDirection = new PVector(mouseX, mouseY);   // Calculate the shooting direction & strength
  mouseDirection.sub(startPosition);
  mouseDirection.mult(-1);   // Other way
  mouseDirection.mult(0.15);  // Scale it down
 
  velocity.set(mouseDirection);
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




