
PVector startPosition;
PVector position;
PVector velocity;

PVector gravity;

PVector otherPosition;
PVector otherVelocity;

float mass = 10;

void setup() {
  size(800, 500); 
  frameRate(25);
  smooth();

  startPosition = new PVector();

  position = new PVector(0, 0);
  velocity = new PVector(0, 0);
  gravity = new PVector(0, 0.3);  // gravity goes down

  otherPosition = new PVector(600, 200);
  otherVelocity = new PVector(0, 0);
}

void draw() {
  background(44);


  /* Check if the two things are close enough, then repell */
  float distance = otherPosition.dist(position);

  PVector repulsion = new PVector(0, 0);

  if (distance < 200) {
    PVector direction = new PVector(otherPosition.x, otherPosition.y);
    direction.sub(position);

    direction.normalize();    // Vector will always have a length of one...

    float strength = map(distance, 200, 0, 0, 2);     // strength of the repulsion based on the distance
    direction.mult(strength);
    direction.mult(-1);
    repulsion.add(direction);
  }


  /* Calculate the movement */
  PVector acceleration = new PVector();
  acceleration.add(gravity);
  acceleration.add(repulsion);

  velocity.add(acceleration);

  position.add(velocity);


  /* Calculate the other movement */
  PVector otherAcceleration = new PVector();
  otherAcceleration.sub(repulsion);   // Add the repulsion in the other direction

  otherVelocity.add(otherAcceleration);
  otherPosition.add(otherVelocity);


  /* Draw the object */
  noStroke();
  fill(255);

  ellipse(position.x, position.y, mass, mass);


  /* Draw the other object */
  float otherDimension = 20;

  if (distance < 200) {    // grows when the projectile gets closer
    otherDimension = map(distance, 200, 0, 20, 20 * 28);
  }

  stroke(128);
  fill(128);
  ellipse(otherPosition.x, otherPosition.y, otherDimension, otherDimension);

  noFill();
  ellipse(otherPosition.x, otherPosition.y, 200 * 2, 200 * 2);  // draw influence radius



  /* Draw slingshot */
  if (mousePressed) {
    stroke(255, 0, 0);
    line(mouseX, mouseY, startPosition.x, startPosition.y);

    noStroke();
    fill(255);

    rectMode(CENTER);
    rect(startPosition.x, startPosition.y, 10, 10);
  } 



  /* Check if the second object leaves the screen. If yes: reset it to some random place */
  if (otherPosition.x < 0 || otherPosition.x > width || otherPosition.y < 0 || otherPosition.y > height) {
    otherPosition.x= random(0, width);
    otherPosition.y= random(0, height);

    otherVelocity.x = 0;
    otherVelocity.y = 0;
  } 


  /* Draw vectors (DO NOT COPY)  */
  stroke(255, 0, 0);
  drawVector(velocity, position, 20);
  stroke(0, 255, 0);
  drawVector(acceleration, position, 200);
}



void mousePressed() {
  startPosition.set(mouseX, mouseY, 0);   // set the new position to where we clicked
}


/* Shoot */
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



