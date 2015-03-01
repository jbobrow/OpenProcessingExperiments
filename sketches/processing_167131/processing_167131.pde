
//Homework 7 by Leiah Fournier

//CREDIT: Daniel

//Number of balls to draw
int numBalls = 100;

//Delaring array
Ball [] balls = new Ball [numBalls];

void setup() {
  size (800,800);
  smooth();
 
 //Create balls
  for (int b = 0; b < numBalls; b++){
    balls [b] = new Ball();
  }
}

void draw(){
  background (333);
  
  //Balls to collide
  for (int b = 0; b < numBalls; b++){
    for (int j = b; j < numBalls; j++){
      
      //Check collision between balls
      if (balls [b] .isCollidingWith (balls[j])) {
        balls [b] .bounceWith (balls[j]);
      }
    }
  }
  
//Calling functions
 for (int b = 0; b < numBalls; b++){
   balls[b].drawBall(2);
   balls[b].updateMovement();
   balls[b].verifyCollision();
 }
}
 //Ball Class
     class Ball {
  float radius;
  PVector position = new PVector (0,0);
  PVector velocity = new PVector (0,0);
  color coloring;
  
  Ball(){
    position.x = random (width - 60);
    position.y = random (height - 60);
    radius = 20;
    velocity.x = random (4);
    velocity.y = random (2);
  }
    
//Position of the balls   
boolean isCollidingWith(Ball balls) {
  return dist (position.x, position.y, balls.position.x, balls.position.y) < (radius + balls.radius) /2;
}
  
  //Change position on x-axis
  void bounceWith (Ball balls){
  position.x *= -1;
  balls.position.x *= -1;
}

//Draw ball and color
void drawBall (float a){
  strokeWeight(1);
 stroke (153); 
  
  if (a != 0 && a != 1) a = 0;
    if (a == 0) ellipse (position.x, position.y, radius, radius);
    if (a == 1) rect (position.x, position.y, radius, radius);
     
  }
  
  //Movement
  void updateMovement(){
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  //Boundaries
  void verifyCollision(){
    if (position.x - radius/2 < 0 || position.x + radius/2 > width){
      velocity.x *= -1;
    }
    if (position.y - radius/2 < 0 || position.y + radius/2 > height){
      velocity.y *=-1;
    }
  }
     }
  


