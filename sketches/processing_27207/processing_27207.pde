
class Fish {
  float x;
  float y;
  float bl;
  float rad = 5;
  float follow;
  int direction = 1;
  
  Fish (float x, float y, float bl, float follow) {
    this.x = x;
    this.y = y;
    this.bl = bl;
    this.follow = follow;
  }
  
  void render() {
    fill(200,0,0);
    stroke(255);
    strokeWeight(5);
    tint(255,255);
    
    //Stop the fish if they are at their limited movement
    if (x <= 395) {x = 395; direction = 1;}
    if (x >= 580) {x = 580; direction = 2;}
    //Drag behind the mouse / easing.
    x += (mouseX - x) * follow;
    
    
    if (direction == 1) {
      image(fishr,x,y);
    }
    if (direction == 2) {
      image(fishl,x,y);
    }
  }
  
  void gravity() {
    
    //Sit on a line, and follow gravity rules
    y = y + speed;
    speed = speed + gravity;
    //When you hit a certain point, add to a bounce variable
    if (y >= bl + rad) {
    speed *= -0.9; 
    bounces++;
    //if a bounce has occured, stop
    }
    if (bounces > 1) {
      y = y + speed;
      speed = 0;
      gravity = 0;
      y = bl;
    }
  }
  
  void jump() {
    //Gain momentum, and reset bounces to 0
      gravity = 0.2;
      speed = -3;
      bounces = 0;
  }
}

