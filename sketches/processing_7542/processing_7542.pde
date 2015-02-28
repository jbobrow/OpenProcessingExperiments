
class Ball {
  float x;
  float y;
  float speed;
  float w;
  
  
  Ball(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.speed = speed;

  }
  
  void gravity() {
    
    speed = speed + gravity;
  }
  
  void move() {

    y = y + speed;
 
   
    if (y > height) {
      speed = speed * -0.95;
      y = height;
    }
  }
  
  void display() {
     

    fill(y-500,0,x+200);
    stroke(0);
    ellipse(x,y,w,w);
  }
 
}

