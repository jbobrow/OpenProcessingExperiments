
class Ball {
  float ballX;
  float ballY;
  float ballRadius;
  float speedY;
  float speedX;
  float gravity;
  float drag;
  float userControlForce;
  color c;
  
  Ball(float _ballX, float _ballY, float _ballRadius, float _speedX, float _speedY, float _gravity, float _drag, float _userControlForce){
    ballX = _ballX;
    ballY = _ballY;
    ballRadius = _ballRadius;
    speedY = _speedY;
    speedX = _speedX;
    gravity = _gravity;
    drag = _drag;
    userControlForce = _userControlForce;
    c = #FF0000;
  }
  
  void display(){
    stroke(0);
    fill(c);
    ellipse(ballX,ballY,ballRadius,ballRadius);
  }
  
  void animate(){    
    ballY += speedY;
    speedY += gravity; 
    ballX += speedX; 
    
    if(keyPressed) {
     if (key == 'w' || key == 'W')
         speedY -= userControlForce;   
     if (key == 's' || key == 'S') 
         speedY += userControlForce;   
     if (key == 'a' || key == 'A') 
         speedX -= userControlForce;   
      if (key == 'd' || key == 'D') 
         speedX += userControlForce;   
     }
  }
  
  void boundingArea(){
    // EDGES OF THE SCREEN
    if(ballY > height-ballRadius && speedY > 0) {
      speedY *= -drag; 
    }
    if(ballY < ballRadius && speedY < 0) {
      speedY *= -drag;
    }
    if(ballX > width-ballRadius && speedX > 0) {
      speedX *= -drag;
    }
    if(ballX < ballRadius && speedX < 0) {
      speedX *= -drag;
    }
  }
  
  void fillColor(int newC){
    c = newC;
  }



}

