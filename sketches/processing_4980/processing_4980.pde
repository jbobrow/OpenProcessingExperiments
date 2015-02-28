
float stiffness = 0.2;
float damping = 0.8;
float velocityX = 0.0;
float velocityY = 0.0;
float targetY, targetX;
float x, y;

void setup() {
  size(400, 400);
  noStroke();
  noCursor();
  rectMode(CENTER);
}

void draw() {
  background(0);
  fill(255);
  float forceY = stiffness * (targetY - y);         // f = -kx
  velocityY = damping * (velocityY + forceY);
  y += velocityY;
  float forceX = stiffness * (targetX - x);         // f = -kx
  velocityX = damping * (velocityX + forceX);
  x += velocityX;
  rect(x, y, 40, 40);
  targetY = mouseY;
  targetX = mouseX;
}


