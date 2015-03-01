
int nBalls = 7;
//Letter
Ball[] balls;
float gravity = 0.1; 

void setup() {  // this is run once.   
    size(500, 500);
    colorMode(HSB);
    balls = new Ball[nBalls];
    for(int i = 0; i < nBalls; i++){
        balls[i] = new Ball ();
//        posX[i] = random(width);    
//        letterSize[i] = random(30, 80);
//        posY[i] = random(height);
//        speedY[i] = 0;
//        speedX[i] = 0;        
//        hue[i] = random(255);
//        myNumber[i] = int(random(0, 9));
    }
} 

void draw() {  // this is run repeatedly.  
    background(0);
    
    for(int i = 0; i < nBalls; i++){
        balls[i].checkBoundaries();
        balls[i].applyPhysics();
        balls[i].checkMousePosition();
//        checkBoundaries(i);
//        applyPhysics(i);    
//        checkMousePosition(i);    
    }
}




class Ball {

  float letterSize;
  float posX;
  float posY;
  float speedY;
  float speedX;
  float hue;
  int myNumber;
  boolean isMoving;
  
  Ball () {
    letterSize = random(30, 80);
    posX = random(width);
    posY = random(height);
    speedY = 0;
    speedX = 0;        
    hue = random(255);
    myNumber = int(random(0, 9));
  }

  void checkBoundaries(){
      //Boundaries
      //GROUND
      if(posY + letterSize/2 >= height){    //touching the ground
          //Set the position to the ground so the object doesn't get stuck
          posY = height - letterSize/2;
          if (speedY > 1) {
              speedY = -speedY * 0.8;    
          } else {
              speedY = 0;
          }
      }
      //SIDES
      //right side
      if(posX + letterSize/2 >= width){
          //Set the position to the right side so the object doesn't get stuck
          posX = width - letterSize/2;       
          speedX = -speedX * 0.8;
      //left side
      }else if(posX - letterSize/2 <= 0){
          //Set the position to the right side so the object doesn't get stuck
          posX = letterSize/2;       
          speedX = -speedX * 0.8;
      }    
      
      for(Ball otherBall : balls){
        float distance = dist(posX, posY, otherBall.posX, otherBall.posY);
        if(distance < (letterSize + otherBall.letterSize)/2 &&
           distance > 0){
//           PVector escape = new PVector(posX - otherBall.posX, posY - otherBall.posY);
//           escape.normalize();
//           posX += escape.x;
//           posY += escape.y;
           speedX = -speedX;
           otherBall.speedX = -(otherBall.speedX);
        }
     }
  }
  
  void applyPhysics(){
      //Acceleration (gravity)
      if(isMoving == true){
          speedY = speedY + gravity;
      }
          
      //Move!
      posX = posX + speedX;    
      posY = posY + speedY;
  }
  
  void checkMousePosition(){
      //Check mouse position
      float saturation = 255;
      float myDistance = dist(mouseX, mouseY, posX, posY);
      if(myDistance < letterSize/2){
          saturation = 150;
          
          speedX = mouseX - pmouseX;            
      }
      isMoving = true;
      //NEW STUFF!!!
      //I'm calling drawCircle from inside checkMousePosition because saturation is a LOCAL variable — that is, it only exists here inside this function
      drawCircle(saturation);
  }
  
  void drawCircle(float _saturation){
      //Draw
      fill(hue, _saturation, 255);
      ellipse(posX, posY, letterSize, letterSize);
      fill(0);
      textSize(letterSize);
      textAlign(CENTER, CENTER);
      text(myNumber, posX, posY);    
  }

}



