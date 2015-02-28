
PVector startPosition;
PVector position;
PVector velocity;
PVector bump;

PVector targetStartPosition;
PVector targetPosition;
PVector targetVelocity;

PVector attraction; 
PVector targetAttraction;

PVector gravity;


float mass = 10;
float targetMass = 50;

float damping = 0.9;

void setup() {
  size(800, 500); 
  frameRate(25);
  smooth();

  startPosition = new PVector();

  //  targetStartPosition = new PVector(width/10*9, random(height));

  position = new PVector(mass, mass);
  velocity = new PVector(0, 0);
  gravity = new PVector(0, 0.3);  // gravity goes down

  targetPosition = new PVector(width/2, height/2);
  targetVelocity = new PVector(5, -10);
  bump = new PVector();

}

void draw() {
//  pushMatrix();
//  rectMode(CORNER);
//  fill(0, 200);
//  rect(0, 0, width, height);
//  popMatrix();

    background(44);

  /* Calculate the movement */
  PVector acceleration = new PVector();

  attraction = new PVector(targetPosition.x, targetPosition.y);
  attraction.sub(position);
  attraction.normalize();
  attraction.mult(targetPosition.dist(position));
  attraction.mult(0.002);

  targetAttraction = new PVector(0,0);
  targetAttraction = attraction;

  acceleration.add(gravity);

  velocity.add(acceleration);

  velocity.add(attraction);

  position.add(velocity);

  targetAttraction.mult(-1);
  targetAttraction.mult(0.2);

  targetVelocity.add(gravity);
  targetVelocity.add(targetAttraction);
  targetPosition.add(targetVelocity);

  /* BEWEGUNG UMKEHREN*/
  if (targetPosition.x > width-(targetMass/2) || targetPosition.x < 0+(targetMass/2)) {
    targetVelocity.x = targetVelocity.x * -1 * damping;
    targetPosition.x = map(targetPosition.x, 0, width, 1, width-1);
  }

  if (targetPosition.y > height-(targetMass/2) || targetPosition.y < 0+(targetMass/2)) {
    targetVelocity.y = targetVelocity.y * -1 * damping;
    targetPosition.y = map(targetPosition.y, 0, height, 1, height-1);
  }

  if (position.x > width - (mass/2) || position.x < 0 + (mass/2)) {
    velocity.x = velocity.x * -1 * damping;
    position.x = map(position.x, 0, width, 1, width-1);
  }
  if (position.y > height - (mass/2) || position.y < 0 + (mass/2)) {
    velocity.y = velocity.y * -1 * damping;
    position.y = map(position.y, 0, height, 1, height-1);
  }

  /* ZIEL GETROFFEN? */
  /* DIE AUSKOMMENTIERTEN ZEILEN KÖNNEN ALS RESTART GENUTZT WERDEN. KREIS WIRD NEU GESETZT */
  if (targetPosition.dist(position)-(mass/2) <= (targetMass/2)+1) {
    fill(255, 0, 0);
    bump.mult(velocity);
    targetVelocity.add(velocity);
    targetVelocity.mult(0.3);
    velocity.mult(0.7);
    velocity.mult(-1);
    targetVelocity.mult(damping);
    velocity.mult(damping);
    //  targetPosition.x = random(width);
    //  targetPosition.y = random(height);
    //  targetMass = random(30, 100);
  } 
  else {
    fill(255);
  }

  //  println(dist(targetPosition.x, targetPosition.y, position.x, position.y));
  //  println(targetPosition.x - position.x);
  //  println(targetPosition.y - position.y);

  /* Draw the object */
  

  pushMatrix();
  stroke(255);
  strokeWeight(1 * map(targetPosition.dist(position), 0, dist(0,0,width,height), 2, 0));
  line(position.x, position.y, targetPosition.x, targetPosition.y);
  strokeWeight(1);
  popMatrix();
  
  noStroke();
  
  ellipse(position.x, position.y, mass, mass);

  ellipse(targetPosition.x, targetPosition.y, targetMass, targetMass);
  
  
  /* Draw slingshot */
  if (mousePressed) {
    stroke(255, 0, 0);
    line(mouseX, mouseY, startPosition.x, startPosition.y);

    noStroke();
    fill(255);

    rectMode(CENTER);
    rect(startPosition.x, startPosition.y, 10, 10);
  } 


  /* Draw vectors (DO NOT COPY)  */
//  stroke(255, 0, 0);
//  drawVector(velocity, position, 20);
//  stroke(0, 255, 0);
//  drawVector(acceleration, position, 200);
//  stroke(0, 0, 255);
//  drawVector(attraction, position, 200);
//
//  stroke(255, 0, 0);
//  drawVector(targetVelocity, targetPosition, 20);
//  stroke(0, 255, 0);
//  drawVector(gravity, targetPosition, 200);
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



