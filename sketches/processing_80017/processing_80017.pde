

PVector startPosition;
PVector position;
PVector velocity;

PVector gravity;
 
float mass = 10;

float xPos = 0;
float yPos = 0;

PVector pos2;
PVector p1;
PVector p2;

////////////////////////////////////////////////////////////////////////////////

void setup() {
  size(800, 500);
  frameRate(25);
  smooth();
   
  startPosition = new PVector();
   
  position = new PVector(0, 0);
  velocity = new PVector(0, 0);
  gravity = new PVector(0, 0.3);  // gravity goes down
  
  pos2 = new PVector(200,200);
  p1 = new PVector();
  p2 = new PVector(100, 100);
}

////////////////////////////////////////////////////////////////////////////////

void draw() {
  background(44);
  
   float distance = position.dist(pos2);
   
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
  
  
    //new object
  
    
   noStroke();
   fill(10, 120);
   
   translate(pos2.x, pos2.y);
   rotate( map(millis(), 0, 10000, 2, TWO_PI) );
   ellipse(0, 0, 102, 72);

  
  if(distance < 80) {
    fill(120, 210, 48);
    
  ellipse(0, 0, 102, 72);
  }
   
  
  
}
 
////////////////////////////////////////////////////////////////////////////////
  
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


