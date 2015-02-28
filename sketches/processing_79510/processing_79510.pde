
PVector startPosition;
PVector position;
PVector velocity;
float mass = 10;

PVector firstTargetPosition;
PVector firstMagnet;
float firstDistance;
float firstAttractionSize = 100;

PVector secondTargetPosition;
PVector secondMagnet;
float secondDistance;
float secondAttractionSize = 100;

int BGColor = 44;

void setup() {
  size(800, 500);
  frameRate(25);
  smooth();

  startPosition = new PVector();

  position = new PVector(width*0.4, height*0.9);
  velocity = new PVector(0, 0);

  firstTargetPosition = new PVector(width*0.3, height*0.5);
  firstMagnet = new PVector(0, 0);
  
  secondTargetPosition = new PVector(width*0.7, height*0.5);
  secondMagnet = new PVector(0, 0);
}

void draw() {
  background(BGColor);
  
  
  /* First attractor magnet calculation */
  firstDistance = firstTargetPosition.dist(position);
  if (firstDistance < firstAttractionSize) {  
    firstMagnet.set(firstTargetPosition);
    firstMagnet.sub(position);
    firstMagnet.mult(0.05); 
    firstMagnet.div(firstDistance/100);
  }else{
    firstMagnet.set(firstTargetPosition);
    firstMagnet.sub(position);
    firstMagnet.mult(0.005); 
    firstMagnet.div(firstDistance/100);
  }
  
  
  /* Second attractor magnet calculation */
  secondDistance = secondTargetPosition.dist(position);   
  if (secondDistance < secondAttractionSize) {
    secondMagnet.set(secondTargetPosition);
    secondMagnet.sub(position);
    secondMagnet.mult(0.05); 
    secondMagnet.div(secondDistance/100);
  }else{
    secondMagnet.set(secondTargetPosition);
    secondMagnet.sub(position);
    secondMagnet.mult(0.005); 
    secondMagnet.div(secondDistance/100);
  }
  

  /* Calculate the movement */
  PVector acceleration = new PVector();
  
  firstMagnet.add(acceleration);
  secondMagnet.add(acceleration);
  
  velocity.add(firstMagnet);  //add the first attractor
  velocity.add(secondMagnet); //add the second attractor

  position.add(velocity);
  


  /* Draw the first connection line */
  if (255 - firstDistance*0.7 >= BGColor){
    stroke(255 - firstDistance*0.7);
    line(position.x, position.y, firstTargetPosition.x, firstTargetPosition.y);
  }
  /* Draw the second connection line */
  if (255 - secondDistance*0.7 >= BGColor){
    stroke(255 - secondDistance*0.7);
    line(position.x, position.y, secondTargetPosition.x, secondTargetPosition.y);
  }
  

  /* Draw the objects */
  noStroke();
  fill(255);

  ellipse(position.x, position.y, mass, mass);  // main object

  ellipse(firstTargetPosition.x, firstTargetPosition.y, 2, 2);  //Draw the first attractor center
  ellipse(secondTargetPosition.x, secondTargetPosition.y, 2, 2);  //Draw the second attractor center

  noFill();
  
  /* Draw the first attractor field */
  if (255 - firstDistance*0.5 >= BGColor){
    stroke(255 - firstDistance*0.5 + 10);
    ellipse(firstTargetPosition.x, firstTargetPosition.y, firstAttractionSize*2, firstAttractionSize*2);  
  }else{
    stroke(BGColor + 10);
    ellipse(firstTargetPosition.x, firstTargetPosition.y, firstAttractionSize*2, firstAttractionSize*2);  
  }
  
  /* Draw the second attractor field */
  if (255 - secondDistance*0.5 >= BGColor){
    stroke(255 - secondDistance*0.5 + 10);
    ellipse(secondTargetPosition.x, secondTargetPosition.y, secondAttractionSize*2, secondAttractionSize*2);  
  }else{
    stroke(BGColor + 10);
    ellipse(secondTargetPosition.x, secondTargetPosition.y, secondAttractionSize*2, secondAttractionSize*2);  
  }
  

  /* Draw slingshot */
  if (mousePressed) {
    stroke(255, 0, 0);
    line(mouseX, mouseY, startPosition.x, startPosition.y);

    noStroke();
    fill(255);

    rectMode(CENTER);
    rect(startPosition.x, startPosition.y, 10, 10);
  }
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
  
  firstMagnet.set(0,0,0);  //reset the first attractor
  secondMagnet.set(0,0,0); //reset the second attractor


}

void drawVector(PVector vec, PVector base, float len) {
  pushMatrix();
  float arrowSize = 4;
  translate(base.x, base.y);
  rotate(vec.heading2D());
  float lineLength = vec.mag() * len;
  line(0, 0, lineLength, 0);
  line(lineLength, 0, lineLength - arrowSize, arrowSize * 0.5);
  line(lineLength, 0, lineLength - arrowSize, -arrowSize * 0.5);
  popMatrix();
}


