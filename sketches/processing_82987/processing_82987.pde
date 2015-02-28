
ArrayList<Agent> agents;
ArrayList<Target> targets;
int amountTargets = 5;
PVector[] targetPositions = new PVector[amountTargets];

void setup() {

  size(600, 600);
  smooth();

  agents = new ArrayList<Agent>();
  targets = new ArrayList<Target>();
  
  for(int i=0; i<amountTargets; i++){
    targets.add(new Target(random(width),random(height),i));
  }
  
}


void draw() {
  background(0);

  text("Agents alive: " + agents.size(), 20, 40);

  /* Draw and simulate agents */
  for (int i = 0; i < agents.size(); i++) {
    Agent a = agents.get(i);

    a.simulate();
    a.draw();
  }
  
  pushStyle();
  noStroke();
  fill(255,0,0);
  for(int i=0; i<targets.size(); i++){
    targets.get(i).draw();
  }
  popStyle();
  
  //targetPosition.set(mouseX,mouseY,0);
  
}


void mouseClicked() {
  Agent a = new Agent(mouseX, mouseY);
  agents.add(a);
}

void keyPressed(){
  for(int i=0; i<amountTargets; i++){
    targets.get(i).reCalculate();
  } 
}
class Agent {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  PVector steer;

  float maxVelocity = 3;         // The maximum speed we can have
  float maxForce = 0.03;      // The maximum force we can have

  float radius = 30;    // Size
  float triangleSize = 3;
  
  float distance = 150;
  
  int indexClosestTarget;
  float distanceToClosestTargetYet=1000;
  float distanceTo_i_Target;

  Agent(float theX, float theY) {    // Constructor
    position = new PVector(theX, theY);
    velocity = new PVector(random(-5,5), random(-5,5));
    acceleration = new PVector(0,0);
    for(int i=0; i<amountTargets; i++){
      distanceTo_i_Target = targets.get(i).position.dist(position);
      if(distanceTo_i_Target<distanceToClosestTargetYet){
        distanceToClosestTargetYet = distanceTo_i_Target;
        indexClosestTarget=i;
        println(i + " closest so far!");
      }else{
        println(i + " is not as close as " + indexClosestTarget);
      }
    }
    println("Closest Target is Target: " + indexClosestTarget);   
  }
  
  void seekClosest(){
    for(int i=0; i<amountTargets; i++){
      distanceTo_i_Target = targets.get(i).position.dist(position);
      if(distanceTo_i_Target<distanceToClosestTargetYet){
        distanceToClosestTargetYet = distanceTo_i_Target;
        indexClosestTarget=i;
      }
    }
  }

  PVector seekAndArrive(){
    seekClosest();
    
    PVector desiredVelocity = PVector.sub(targets.get(indexClosestTarget).position,position);
    desiredVelocity.limit(maxVelocity);
    
    float theDistance = abs(targets.get(indexClosestTarget).position.dist(position));
    if(theDistance < distance){
      float slowdown = map(theDistance, 150, 0, 1, 0);
      desiredVelocity.mult(slowdown);
    }
    
    PVector steer = PVector.sub(desiredVelocity,velocity);
    steer.limit(maxForce);
    return steer;    
  }
  
  /* Calculate all forces and apply them to the agents position and velocity */
  void simulate() {
    acceleration.mult(0);  // Reset acceleration
    steer = seekAndArrive();
    acceleration.set(steer);
    velocity.add(acceleration);
    velocity.limit(maxVelocity);    // speed limit
    position.add(velocity);
    wrapAround();
  }


  /* Wrap around the screen edges */
  void wrapAround() {
    if (position.x < 0) position.x = width;
    if (position.x > width) position.x = 0;
    if (position.y < 0) position.y = height;
    if (position.y > height) position.y = 0;
  }


  /* Draw the agent */
  void draw() {
    float rotation = velocity.heading2D() + PI * 0.5;

    noStroke();
    fill(255);

    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation);
    triangle(0, -triangleSize*2, -triangleSize, triangleSize, triangleSize, triangleSize);
    noFill();
    stroke(255);
    ellipse(0, 0, radius * 0.5, radius * 0.5);
    popMatrix();
  }
}

class Target{

  PVector position;
  int index;
  
  Target(float xPos,float yPos, int _index){
    position = new PVector(xPos,yPos);
    index = _index;
  }
  
  void draw(){
    pushMatrix();
    pushStyle();
    translate(position.x,position.y);
    ellipse(0,0,15,15);
    text(index, 10, 10);
    popStyle();
    popMatrix();
  }
  
  void reCalculate(){
    position.set(random(width),random(height),0);
  }

}


