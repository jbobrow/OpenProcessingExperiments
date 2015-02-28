
PVector startPosition;
PVector position;
PVector velocity;

PVector targetVelocity;
PVector targetPosition;
 
PVector gravity;
 
float mass = 10;
 
void setup() {
  size(800, 500);
  frameRate(25);
  smooth();
   
  startPosition = new PVector();
  
  targetPosition = new PVector(650, 250);
    targetVelocity = new PVector(0, 0);
 
   
   
  position = new PVector(0, 0);
  velocity = new PVector(0, 0);
  gravity = new PVector(0, 0.3);  // gravity goes down
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
  fill(255);
 
  ellipse(position.x, position.y, mass, mass);
  
   /* Ellipse */
   targetVelocity.add(gravity);
   targetPosition.add(targetVelocity);
   
   
   fill(255);
   ellipse(targetPosition.x, targetPosition.y, 40, 40);
   
   float distance = position.dist(targetPosition);
   
   if(distance < 25) {
       // targetVelocity.x = 2;
       targetVelocity.set(velocity);
     }
     
     
     if(targetPosition.y > height) {
        targetPosition.x = 400;
       targetPosition.y = 20;
      
      targetVelocity.x = 0;
            targetVelocity.y = 0;

       
     }
   
 
  /* Draw slingshot */
  if(mousePressed) {
    stroke(255, 0, 0);
    line(mouseX, mouseY, startPosition.x, startPosition.y);
     
    noStroke();
    fill(255);
     
    rectMode(CENTER);
    rect(startPosition.x, startPosition.y, 10, 10);
  }
   
   
  /* Draw vectors (DO NOT COPY)  */
  stroke(255, 0, 0);
  drawVector(velocity, position, 20);
  stroke(0, 255, 0);
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
