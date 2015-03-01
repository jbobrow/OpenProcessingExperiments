
//This is the Ball class.  It describes a ball which has
//a position and a velocity and can move, draw itself, 
//and bounce off edges. 
class Ball {
  
  //These are fields of the ball.  They are adjectives describing
  //its location and velocity.
  PVector location;
  PVector velocity;
  
  //This is a constructor.  It is SPECIAL method, a verb 
  //describing how to make a ball.
  Ball(PVector l, PVector v) {
    location = l;
    velocity = v;
  }
  
  //This method moves the ball forward
  void move() {
    location.add(velocity); 
  }
  
  //This method draws the ball on the screen
  void drawSelf() {
    ellipse(location.x, location.y, 10, 10);
  }
  
  //This method bounces the ball off the edges of the window
  void checkEdges() {
    if(location.x < 0 || location.x > width) {
      velocity.x = -velocity.x;
    } 
    
    if(location.y < 0 || location.y > height) {
      velocity.y = -velocity.y; 
    }
  } 
}

//GLOBAL VARIABLES!
PVector L = new PVector(width/2, height/2);
PVector V = new PVector(1, 2);
Ball myBall = new Ball(L, V);
Ball myBall2 = new Ball(new PVector(10, 10), new PVector(-5, 2));

void setup() {
 size(600, 600); 
}

void draw() {
  background(255);
  myBall.move();
  myBall.checkEdges();
  myBall.drawSelf();
  
  myBall2.move();
  myBall2.checkEdges();
  myBall2.drawSelf();
}


