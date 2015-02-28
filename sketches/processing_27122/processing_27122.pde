
class Ball{
  
  int w = 5;
  int h = 5;
  float xPos;
  float yPos;
  float ySpeed;
  float i;
  float gravity = 1.4;
  
}

void drawball(Ball myball){
    
   
    ellipse(myball.xPos, myball.yPos, myball.w, myball.h);
    myball.yPos += myball.ySpeed;
    myball.ySpeed += 1;
    myball.i=1;
    
    if (myball.yPos > height){
      myball.yPos = height;
      myball.ySpeed = -myball.ySpeed/myball.gravity;
    }
    
   
    
  }
  


