
PVector location; 
PVector velocity;

int boxSize = 400;
int ballSize = 50;
float rot = 0.0;

void setup() {
  size(640,360,OPENGL);
  location = new PVector(100,100,-100);
  velocity = new PVector(2.5,5,-5);
  rectMode(CENTER);
}

void draw() {
  background(#888888);

  location.add(velocity);
  
  if ((location.x > boxSize/2 - ballSize) || (location.x < -boxSize/2 + ballSize)) {
    velocity.x = velocity.x * -1; 
  }
  if ((location.y > boxSize/2 - ballSize) || (location.y < -boxSize/2 + ballSize)) {
    velocity.y = velocity.y * -1; 
  } 
  
  if ((location.z > boxSize/2 - ballSize) || (location.z < -boxSize/2 + ballSize)) {
    velocity.z = velocity.z * -1; 
  } 

    
  pushMatrix();
  noFill();
  stroke(255);
  translate(width/2, height/2, -boxSize);
  rotateY(rot);
  box(boxSize);
  fill(175);
  translate(location.x, location.y, location.z);
  sphere(ballSize);
  popMatrix();
  
  rot += 0.01;
}
