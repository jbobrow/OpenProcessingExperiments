
// simple car
 
PVector position, velocity;
float angle, steerAngle;
 
boolean[] keys = new boolean[256];
 
//
void setup() {

  //
  size(500,500);
  smooth();
   
  //
  velocity = new PVector();
  position = new PVector(width * 0.5, height * 0.5);
   
  //
  angle = 0.0;
  steerAngle = 0.0;
   
}
 
 
//
void draw() {
rect (250,250,3,2
   rect(30, 20, 50,50);
  //
  background(50);
 
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
  float factor = constrain(forwardVelocity * 0.3, -1.0, 1.0);
  if(keys[37]) {
    angle += 0.04 * factor;
    steerAngle = - PI * 0.10;
  }
  if(keys[39]) {
    angle -= 0.04 * factor; 
    steerAngle = PI * 0.10;
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
  float sidewaysFriction = - constrain(sidewaysVelocity * 10.0, -2.0, 2.0);
  force.add(PVector.mult(vector2, sidewaysFriction)); 
   
  //
  force.div(10.0);
  velocity.add(force);
  position.add(velocity);
   
  //
  position.x = (position.x + width) % width;
  position.y = (position.y + height) % height;
   
  //
  fill(0, 100);
  noStroke();
  rectMode(CENTER);
  //
  pushMatrix();
  translate(position.x, position.y);
  rotate(-angle);
  rect(0, 0, 25, 50);
  pushMatrix();
  translate(10,17);
  rotate(steerAngle);
  rect(0, 0, 5, 10);
  popMatrix();
  pushMatrix();
  translate(-10,17);
  rotate(steerAngle);
  rect(0, 0,5,10);
  popMatrix();
  pushMatrix();
  translate(-10,-17);
  rect(0, 0, 5, 10);
  popMatrix();  
  pushMatrix();
  translate(10,-17);
  rect(0, 0, 5, 10);
  popMatrix();  
  popMatrix();
   
}
 
 
//
void keyPressed() {keys[keyCode] = true;}
void keyReleased() {keys[keyCode] = false;}
