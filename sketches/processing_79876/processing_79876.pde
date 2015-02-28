

PVector gravity;

// ball

PVector startPosition;
PVector position;
PVector velocity;
float mass = 10;

// target

PVector target;
float targetPos = 400;
float radius = 40;

void setup() {

  size(800, 500);
  frameRate(25);
  smooth();

  startPosition = new PVector();

  target = new PVector(targetPos,targetPos);
  position = new PVector(0, 0);
  velocity = new PVector(0, 0);
  
  gravity = new PVector(0, 0);  // gravity goes down
  
  
}

void draw() {
  background(44);
  
  // distance
  float distance = position.dist(target);
  println(distance); 
  PVector direction = new PVector();
  
  if (distance < 200) {
    
  direction.set(position);
  direction.sub(target);
  direction.normalize();
  
  direction.mult(map(distance,0,200,5,0.1));
  
 // direction.mult(0.01);
  direction.mult(-1);
  

  }

  /* Calculate the movement */
  PVector acceleration = new PVector();
  acceleration.add(gravity);
  acceleration.add(direction);
  velocity.add(acceleration);
  position.add(velocity);

  /* Draw the object */
  noStroke();
  mass = (velocity.mag())*-2;
  ellipse(position.x, position.y, mass, mass);
  
  // screen
  
  if ((position.x > width) || (position.x <=0)) {
   velocity.x= velocity.x*-1;
  }
   if ((position.y > height) || (position.y <=0)) {
   velocity.y= velocity.y*-1;
  }
  
   
  noStroke();
  /// comparison 
  if (distance < mass ) { 
  fill(0,255,0);
   ellipse(targetPos,targetPos,100,100);
  } else {
    fill(250); 
   ellipse(targetPos,targetPos,radius,radius);
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


