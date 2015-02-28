
PVector startPosition;
PVector position;
PVector velocity;
PVector gravity;
 
float mass = 10;
float mass2 = 40;
float friction = -0.9;

PVector position2; 

boolean targetActive;
boolean burstToggle;
int burstSize = 50;
PVector burstStartingPoint;
PVector[] burstParticlePositions;
PVector[] burstParticleSpeeds;
float burstParticleDuration;
float burstStartTime;

float shrinkDuration;
float shrinkStartTime;

int scoreCount;

void setup() {
  size(800, 500);
  frameRate(25);
  smooth();
   
  burstSetup();
  targetActive = true;
  
  startPosition = new PVector();
   
  position = new PVector(0, 0);
  velocity = new PVector(0, 0);
  gravity = new PVector(0, 0.3);  // gravity goes down
  
  position2 = new PVector(width - 100, height/2);
  
  scoreCount = 0;
  
  textFont(createFont("Georgia",96));
  textAlign(CENTER, CENTER);  
}

/* Set up the burst (explosion) variables and parameters */

void burstSetup() {
  burstParticleDuration = 2500;
  burstStartTime = 0;
  burstStartingPoint = new PVector(0,0);
  burstParticleSpeeds = new PVector[burstSize];
  burstParticlePositions = new PVector[burstSize];
  burstToggle = false;
  
  shrinkDuration = 350;
  shrinkStartTime = 0;
  
  for (int i = 0; i < burstSize; i++) {
    burstParticleSpeeds[i] = new PVector();
    burstParticlePositions[i] = new PVector();
  }
}

/* Update the starting position for all burst particles  */

void burstSetCoordinates(PVector coordinates) {
  for (int i = 0; i < burstSize; i++) {
    burstParticlePositions[i].set(coordinates.x, coordinates.y, 0);
  }
}
  
void draw() {
  background(44);
 
  /* Calculate the movement */   
  
  PVector acceleration = new PVector();
  acceleration.add(gravity); 
  velocity.add(acceleration);
  
  /* Detect player token collisions to the screen boundaries */
  
  if (position.x > width) {
    position.x = width;
    velocity.x *= friction;
  } else if (position.x < 0) {
    position.x = 0;
    velocity.x *= friction;
  }
  
  if (position.y > height) {
    position.y = height;
    velocity.y *= friction;
  } else if (position.y < 0) {
    position.y = 0;
    velocity.y *= friction;
  }
  
  position.add(velocity);
  
  /* Detect a collision/hit */
  
  float distance = position.dist(position2);
  
  if (distance < mass2-2 && targetActive) {
    scoreCount++;
    targetActive = false;
    burstStartingPoint = new PVector(position2.x,position2.y,0);
    PVector multVector = new PVector(-1,-1,-1);
    velocity.mult(multVector);
    fill(255, 255, 0);
    burstSetCoordinates(position2);
    burstToggle = true;
    burstStartTime = millis();
    shrinkStartTime = millis();
    for (int i = 0; i < burstSize; i++) {
      burstParticleSpeeds[i].set(random(-12,12), random(-12,12), 0);
    }
  }
  
  /* Draw the burst particles */
  
  if (burstToggle && (millis() <= (burstStartTime + burstParticleDuration))) {
    
    float particleAlphaValue = (((burstStartTime + burstParticleDuration) - millis()) / burstParticleDuration)*255;
    fill(random(0,255),random(0,255),random(0,255), particleAlphaValue);
    stroke(random(0,255),random(0,255),random(0,255), particleAlphaValue);
    for (int i = 0; i < burstSize; i++) {
      burstParticlePositions[i].add(burstParticleSpeeds[i]);
      friction = -0.9;
      ellipse(burstParticlePositions[i].x, burstParticlePositions[i].y, 3, 3);
      line(burstStartingPoint.x, burstStartingPoint.y, burstParticlePositions[i].x, burstParticlePositions[i].y);
    }
  } else if (burstToggle){
    position2.set(random(0, width), random(0, height), 0);
    burstToggle = false;
  }
  
  /* Do the shrink effect when the object is hit */
  
  fill(255);
  
  if (burstToggle && (millis() <= (shrinkStartTime + shrinkDuration))) {
    float shrinkValue = (((shrinkStartTime + shrinkDuration) - millis()) / shrinkDuration)*mass2;
    ellipse(position2.x, position2.y, shrinkValue, shrinkValue);
  } else if (!burstToggle) {
    ellipse(position2.x, position2.y, mass2, mass2);
    targetActive = true;
  }
  
  /* Draw slingshot */
  if(mousePressed) {
    stroke(200);
    line(mouseX, mouseY, startPosition.x, startPosition.y);
     
    noStroke();
    fill(255);
     
    rectMode(CENTER);
    rect(startPosition.x, startPosition.y, 5, 5);
  }
   
  /* Draw the controlled  object */
  stroke(200);
  drawVector(velocity, position, 20);
  stroke(100);
  drawVector(acceleration, position, 200);

  noStroke();
  fill(255);
  ellipse(position.x, position.y, mass, mass);  
  
  /* Draw score counter */
  
  text(scoreCount, width/2, (96/2)+10);
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




