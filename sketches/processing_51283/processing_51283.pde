
class Ball {
  
  float x;
  float y;
  float d;
  
  float speedX = random(-2,2);
  float speedY;
  
  color c = color (random(150,255),random(150,255),0,200);
  
  Ball(float x_,float y_, float d_){
    x = x_;
    y = y_;
    d = d_;
  }
  
  void displayBall(){
    strokeWeight(3);
    fill(c);
    ellipse(x,y,d,d);
  }
  
  void gravity(){
    speedY = speedY + gravity;
  }
  
  void bounceBall(){
    y = y + speedY;
    x = x + speedX;
    
    if (x + d/2 >= width || x - d/2 <= 0){
      speedX = speedX * -1;
    }
    
    if (y + d/2 >= height){
      speedY = speedY * -0.95;
      y = height - d/2;
    }
  }
}
    

