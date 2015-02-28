
// simple car by Luke O'Connor
 
PVector position, velocity;
float angle, steerAngle;
 
boolean[] keys = new boolean[256];
 
//
void setup() {
   
  //
  size(700, 700);
  smooth();
   
  //
  velocity = new PVector();
  position = new PVector(width * 2.5, height * 2.5);
   
  //
  angle = 0.0;
  steerAngle = 0.0;
   
}
 
 
//
void draw() {
   
  //
  background(255,255,0);
 
  //
  PVector force = new PVector(); 
   
  //
  PVector vector1 = new PVector(sin(angle), cos(angle));
  PVector vector2 = new PVector(vector1.y, - vector1.x);
   
  //
  float forwardVelocity = vector1.dot(velocity);
  float sidewaysVelocity = vector2.dot(velocity);
 
  //
  steerAngle = 0.0;
  float factor = constrain(forwardVelocity * 0.5, -1.5, 1.5);
  if(keys[37]) {
    angle += 0.05 * factor;
    steerAngle = - PI * 0.20;
  }
  if(keys[39]) {
    angle -= 0.05 * factor; 
    steerAngle = PI * 0.20;
  }
   
  //
  force.add(PVector.mult(vector1, -forwardVelocity * 0.1));
  if(keys[38]) {
    force.add(PVector.mult(vector1, 1.0));
  }   
  if(keys[40]) {
    force.add(PVector.mult(vector1, -1.0));
  }  
   
  //
  float sidewaysFriction = - constrain(sidewaysVelocity * 10.0, -5.0, 5.0);
  force.add(PVector.mult(vector2, sidewaysFriction)); 
   
  //
  force.div(7.5);
  velocity.add(force);
  position.add(velocity);
   
  //
  position.x = (position.x + width) % width;
  position.y = (position.y + height) % height;
   
  //
  fill(25, 100);
  noStroke();
  rectMode(CENTER);
  //
  pushMatrix();
  translate(position.x, position.y);
  rotate(-angle);
  rect(0, 0, 35, 75);
  pushMatrix();
  translate(10,17);
  rotate(steerAngle);
  rect(0, 5, 5, 10);
  popMatrix();
  pushMatrix();
  translate(-10,17);
  rotate(steerAngle);
  rect(0, 5, 5, 10);
  popMatrix();
  pushMatrix();
  translate(-10,-17);
  rect(0, -5, 5, 10);
  popMatrix();  
  pushMatrix();
  translate(10,-17);
  rect(0, -5, 5, 10);
  popMatrix();  
  popMatrix();
   
}
 
 
//
void keyPressed() {keys[keyCode] = true;}
void keyReleased() {keys[keyCode] = false;}

