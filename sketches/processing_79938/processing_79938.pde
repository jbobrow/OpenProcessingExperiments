
PVector startPosition;
PVector position;
PVector velocity;
 
PVector p1;
PVector p2;
 
PVector gravity;
 
float mass = 10;
 
void setup() {
  size(800, 500);
  frameRate(25);
  smooth();
   
  p1 = new PVector(250,250);
  p2 = new PVector();
   
  startPosition = new PVector();
   
  position = new PVector(0, 0);
  velocity = new PVector(0, 0);
  gravity = new PVector(0, 0.3);  // gravity goes down
}
 
void draw() {
  background(44);
  
  p2.x = mouseX;
  p2.y = mouseY;
  
  float distance = p1.dist(position);
  
  if(distance < 20) {
    fill(0, 255, 0);
    background(255, 0, 0);
  }
  else
      fill(50,50,50);
  noStroke();    
  ellipse(p1.x,p1.y,50,50);
  

  
  
  /* Calculate the movement */   
  PVector acceleration = new PVector();
  acceleration.add(gravity);
   
  velocity.add(acceleration);
 
  position.add(velocity);
 
 
  /* Draw the object */
  noStroke();
  fill(255);
 
  ellipse(position.x, position.y, mass, mass);
  

   
 
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


