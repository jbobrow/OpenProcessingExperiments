

PVector startPosition;
PVector position;
PVector velocity;
PVector position2;

PVector gravity;

float mass1 = 50;
float mass2 = 50;
float R = -0.9;

int speedx = 11;
int speedy = 6;

void setup() {
  size(800, 600);
  frameRate(50);
  smooth();

  startPosition = new PVector();

  position = new PVector(width/2, 0);
  velocity = new PVector(5, 2);
  gravity = new PVector(0, 0.1);  // gravity goes down
  position2 = new PVector();
}

void draw() {
  
  fill(0,5);
  rect(0,0,width,height);
 // background(0);
 

  // red ball
  position2.x += speedx;
  position2.y += speedy;

  fill(255, 0, 0);
  noStroke();

  if (position2.x > width || position2.x < 0) {
    speedx = speedx * -1;
  }
  if (position2.y > height || position2.y < 0) {
    speedy = speedy * -1;
  }
  ellipse( position2.x, position2.y, 30, 30);
  
  // collision

  float distance = position.dist(position2);

  
   if (distance < 100) {
   fill(203, 0, 203);
    mass1 = 150;
    mass2 = 150;

  } 
  else {
    fill(0, 0, 225);
    mass1 = 50;
    mass2 = 50;
    
  }
  


  ellipse(position.x, position.y, mass1, mass2);

  /* Calculate the movement */
  PVector acceleration = new PVector();
  acceleration.add(gravity);

  velocity.add(acceleration);

  position.add(velocity);

  // wall 
  if (position.x > width) {
    position.x = width;
    velocity.x *= R;
  } 
  else if (position.x < 0) {
    position.x = 0;
    velocity.x *= R;
  }

  if (position.y > height) {
    position.y = height;
    velocity.y *= R;
  } 
  else if (position.y < 0) {
    position.y = 0;
    velocity.y *= R;
  }

  position.add(velocity);
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
  line(lineLength, 0, lineLength - arrowSize, arrowSize * 0.5);
  line(lineLength, 0, lineLength - arrowSize, -arrowSize * 0.5);
  popMatrix();
}



