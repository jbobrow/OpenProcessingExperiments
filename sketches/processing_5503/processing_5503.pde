
class Ball extends World {

    // Unfortunately extending world doesn't present a saving since the World's variables are 
    // stored in each individual instance of Ball.  Need to do some more reading up on OOP...
    
  // specific to each ball    
  float x, y;
  float vx = 0;
  float vy = 0;
  float radius;
  float mass = 1;
  float bounce = 0.9;
  //float startW, startH;
  boolean drag = false;

  //Constructor
  // a motionless ball
  Ball(float x, float y, int radius) {
    this.vx = vx;
    this.vy = vy;
    this.x = x;
    this.y = y;
    this.radius = radius;
  }
  
  // a moving ball
  Ball(float x, float y, int radius, float vx, float vy) {
    this.vx = vx;
    this.vy = vy;
    this.x = x;
    this.y = y;
    this.radius = radius;
//    this.h = h;
  }
  
  //Methods
  void display() {
    // These should obviously be optional and changeable through instantiation
    noStroke();
//    strokeWeight(1);
    fill(255, 155, 0,200);
    //
    ellipseMode(CENTER);
    ellipse(x, y, radius*2, radius * 2);
    smooth();
  }
  
  void move() {
    if (!this.drag){
      this.vx *= FRICTION;
      this.vy *= FRICTION;
      this.vy += GRAVITY;
      this.x += this.vx;
      this.y += this.vy;
    }
    checkWalls();
    display();
  }
  
  void checkWalls() {
    if (this.x > rightLmt - this.radius) {
      this.vx *= -this.bounce;
      this.x = rightLmt - this.radius;
    }  
    else if (this.x < leftLmt + this.radius) {
     this.vx *= -this.bounce; 
     this.x = leftLmt + this.radius;
    }    
    if (this.y > bottomLmt - this.radius) {
      this.vy *= -this.bounce;
      this.y = bottomLmt - this.radius;
    }  
    else if (this.y < topLmt + this.radius) {
     this.vy *= -this.bounce; 
     this.y = topLmt + this.radius;
    } 
  }
  
  
  
}

