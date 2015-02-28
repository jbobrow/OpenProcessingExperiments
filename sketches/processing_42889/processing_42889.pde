
//pseudo code ref for Boid's algorithm http://www.kfish.org/boids/pseudocode.html
int NUM_THINGS = 100;

Thing[] things = new Thing[NUM_THINGS];
 
void setup() {
  size(500, 500); 
  smooth();
  for (int i = 0; i < NUM_THINGS; i++) {
    things[i] = new Thing(random(0,width), random(0,height));   
    things[i].angleDirection = (random(0, 360));
  }
  background(0);
}
 
void draw() { 
  fill(0,0,0,25);
  rect(0,0,width, height);
  for (int BoidIndex = 0; BoidIndex<NUM_THINGS; BoidIndex++) {
    //Boid 1
    PVector perceivedCenter = new PVector(0,0);
    //Boid 2 
    PVector collisionV = new PVector(0,0);
    //Boid 3
    PVector avgVelocity = new PVector(0,0);
    
    for(int otherBoidIndex = 0; otherBoidIndex < NUM_THINGS; otherBoidIndex++){
      if (otherBoidIndex != BoidIndex) {
        perceivedCenter.add(things[otherBoidIndex].position);
        avgVelocity.add(things[otherBoidIndex].velocity);
        PVector diff = things[otherBoidIndex].position; diff.sub(things[BoidIndex].position);
        if (diff.mag() < things[BoidIndex].myDiameter) {
          collisionV.sub(diff); 
        }
      }
    }
    perceivedCenter.div(NUM_THINGS -1); avgVelocity.div(NUM_THINGS-1);
    perceivedCenter.sub(things[BoidIndex].position); avgVelocity.sub(things[BoidIndex].velocity);
    if (perceivedCenter.y == 0) {
      perceivedCenter.y = 1;
    }
    perceivedCenter.div(100); //100 will make it move 1% toward destination.
    if (avgVelocity.y == 0) {
      avgVelocity.y = 1;
    }
    avgVelocity.div(8); //add an eighth to current velocity
    //update
    things[BoidIndex].update(perceivedCenter, collisionV, avgVelocity);
  }
  for(int i = 0; i<NUM_THINGS; i++)
  {
    things[i].show();
  }
}

void mouseMoved() {
  for (int i = 0; i < NUM_THINGS; i++){
    things[i].angleDirection+= mouseX/(mouseY+1); 
  }
}

class Thing {
  
  //parameters of my thing
  float myDiameter = 5;
  PVector position;
  color col = #FFFFFF;
  PVector velocity = new PVector(1,1);
  float angleDirection = 0;
  float speedLimit = myDiameter/2;
  boolean ellipses = false;
  
  Thing(float X, float Y){
    position = new PVector(X,Y);
  }
 
  void update(PVector Boid1, PVector Boid2, PVector Boid3){
    if (angleDirection >= 360)
    {
      angleDirection = 0;
    }
    float direction = radians(angleDirection);
    //velocity.add(Boid1.add(Boid2.add(Boid3)));
    velocity.add(Boid1, Boid2, Boid3);
    if (velocity.mag() > speedLimit) {
      velocity.div(velocity.mag()); velocity.mult(speedLimit);
    }
    //position.add(velocity);
   
    //multiply velocity by the veritical component (sinus) and horizontal component (cosinus) of direction  
     PVector directionComponents = new PVector(cos(direction)*velocity.x, sin(direction) *velocity.y);
     position.add(directionComponents);
    //position.add(velocity);
    
  }
  void show()
  {
    //managing borders
    if (position.x > width){
      position.x = myDiameter;
    }
    if (position.x < 0){
      position.x = width-myDiameter;
    }
    if (position.y > height){
      position.y = myDiameter;
    }
    if (position.y < 0){
      position.y = height-myDiameter;
    }
    //draw the thing  
    if (mousePressed== false) {
      fill(col);
      ellipse(position.x, position.y, myDiameter, myDiameter);
     // myDiameter = 5;
    }
    else {
      if (mouseButton == RIGHT){
        position = new PVector(random(0, width), random(0,height)); 
        angleDirection = random(0,360);
        //myDiameter = 10;
      }
      //myDiameter = 2;
      house(position.x, position.y, (int)position.x, (int)mouseX/(mouseY+1), (int)position.y, (int)angleDirection );
    }
  }
  void house(float x, float y, int r, int g, int b, int angle)
    {
      if (r > 255 || r < 0){ 
        r = 255; 
      }
      if (g > 255 || g < 0){
       g = 255;
      }
     if (b > 255 || b < 0) {
      b = 255;
     } 
     
     float housetipX = 15;
     float housetipY = 0;
     float leftRoofCornerX = 0;
     float leftRoofCornerY = 15 ;
     float rightRoofCornerX = 30 ;
     float rightRoofCornerY = 15;
     float doorX = 12;
     float doorY = 30;
     if (r == g && g==b && b==0){
       stroke(255);
     }
     else {
       stroke(r,g,b);
     }
     pushMatrix();
     translate(2*x,2*y);
     rotate(radians(angle));
     translate(-x,-y);
     triangle(housetipX,housetipY,leftRoofCornerX,leftRoofCornerY,rightRoofCornerX,rightRoofCornerY);
     rect(leftRoofCornerX,leftRoofCornerY,30,30);
     rect(doorX,doorY,10,15);
     popMatrix();
    }
  
}


                
                                
