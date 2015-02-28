
class Ball{
  float xPos;
  float yPos;
  float speed;
  float acc;
  
  Ball(float x, float y, float w){
    xPos = x;
    yPos = y;
    speed = 0;
  }
    
  
  Ball(){
    yPos = height/2;
    speed = 0;
    acc = random(0.5, 0.3);
  }
  
  void gravity(){
    speed = speed + gravity;
  }
  
  void move(){
    speed += acc;
    yPos += speed;
    if (yPos >= height){
      speed *= -0.95;
      yPos = height;
    }
  }
 
 void display(){
  fill(random(255), 255, random(255));
  noStroke();
  ellipseMode(CENTER);
  ellipse(xPos, yPos, 5, 5);
 }
}


