
Ball ball = new Ball();
PVector direction = new PVector(0,0);

void setup() {
  size(400,400);
  frameRate(30);
}

void draw() {
  background(0);
  ball.display();
  ball.update();
  
}

//void mouseClicked() {
//  direction.set(mouseX,mouseY);
//  direction.sub(ball.position);
//  direction.normalize();
//  direction.mult(15);
//  ball.velocity.add(direction);
//  print("hi");
//}
class Ball {
  PVector position = new PVector(width/2,height/2);
  PVector velocity = new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  float bounce = 0.6;
  
  Ball(){
    position.set(200,200);
  }
  
  void update() {
    if(position.y >= height) {
      position.y = height;
      velocity.y = -velocity.y*bounce;
      acceleration.y = 0;
      //prevent infinite jitter
      if(abs(velocity.y) <1) {
        velocity.y = 0;
      }
      velocity.x = 0.9*velocity.x;
    }
    else {
      acceleration.y = 0.5;
    }
    if(position.x < 0) {
      velocity.x = -velocity.x*bounce;
      position.x = 0;
    }
    else if(position.x > width){
      velocity.x = -velocity.x*bounce;
      position.x = width;
    }
    if(mousePressed) {
      direction.set(mouseX,mouseY);
      direction.sub(position);
      direction.normalize();
      direction.mult(0.004);
      acceleration.set(direction);
      fill(255,0,0);
      ellipse(mouseX,mouseY,5,5);
      stroke(255,0,0);
      line(mouseX,mouseY,position.x,position.y);
    }
    else{
      acceleration.set(0,0.5);
    }
    velocity.add(acceleration);
    position.add(velocity);
  }
  
  void display() {
    fill(255);
    noStroke();
    ellipse(position.x,position.y,25,25);
  }
  
}


