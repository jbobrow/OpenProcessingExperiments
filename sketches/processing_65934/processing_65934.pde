
class VectorBall {
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  int raidus;
  float mass;
  float direction;
  boolean clicked;

  VectorBall(int Xpos, int Ypos, int ballsize) {
    position.x = Xpos;
    position.y = Ypos;
    raidus = ballsize;
  }

  void update() {
    if(velocity.x != 0){
      direction = atan(velocity.y/velocity.x);
    }
    else{
      direction = 0;
      if(velocity.y > 0){
        direction = PI/2;
      }
      if(velocity.y < 0){
        direction = -PI/2;
      }
    }
    
    if(position.mag() != 0){
      position.add(velocity);
    }
    
    
    ellipse(position.x, position.y, raidus/2, raidus/2);
  }

  void rotateBall(float rotation){
    velocity.x = cos(direction+rotation)*velocity.mag();
    velocity.y = sin(direction+rotation)*velocity.mag();
  }

  void friction(float c) {
    velocity.div(c+1);
  }

  void bounceEdge() {
    if (position.x > width || position.x < 0) {
      velocity.x = -velocity.x;
    }
    if (position.y > height || position.y < 0) {
      velocity.y = -velocity.y;
    }
  }
  
  void spawnable(){
    if(mousePressed){
      position.x = mouseX;
      position.y = mouseY;
      clicked = true;
    }
    if(!mousePressed && clicked == true){
        velocity.x = mouse_velocity.x/mass;
        velocity.y = mouse_velocity.y/mass;
        clicked = false;
      }
    if(keyPressed){
      position.x = width/2;
      position.y = height/2;
    }
  }
}

