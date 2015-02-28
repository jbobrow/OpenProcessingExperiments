
class Ball {
  int bX, bY, speed, ballHue;
  float angle;
  int ballBrightness = 0;
  int brightChange = 1;
  Vector drawnBalls;
  
  Ball(int y, float a, int h){
    bX = int(random(border-5, border+10));
    bY = y;
    speed = 6;
    angle = a;
    ballHue = h;
    drawnBalls = new Vector();
  }
  
  
  void draw(){
    int[] position = {ballBrightness, bX, bY}; //add the brightness and coordinates of each ball to a vector
    if(!pause){
      drawnBalls.add(position);
    }
    for(int i=0; i<drawnBalls.size(); i++){ //iterate through vector and entire trajectory of the ball
      int[] p = (int[])drawnBalls.get(i);
      fill(ballHue, 300, p[0], ballTransparency);
      ellipse(p[1],p[2],10,10);
    }

    if(!pause){
      bY += angle;
      bX += speed;
      ballBrightness += brightChange;
    }
  }
  
  void bounce(){ //change the angle of the ball
    if(goBounce){
      angle *= -1;
      speed = int(random(4,7));
      if(angle == 0){
        angle = -1;
      }
    }
  }
  
  boolean touchCheck(Ball other){ //check if balls are touching
      float dx = other.bX - bX;
      float dy = other.bY - bY;
      float distance = sqrt(dx*dx + dy*dy);
      if (distance < 10) { 
        return true;
      }
      else return false;
  }
  
  void zoneCheck(){ //check which zone of the screen each ball is in
    int zone1 = 150;
    int zone2 = width-300;
    int end = width-border;
    int above = int(height/2-50);
    int below = int(height/2+100);
    
    if(bY <= above || bY >= below){ //above or below the mid-screen confines in which balls bounce
      bounce();
    }
    if(bX >= end){ //end of the screen
      angle = 0;
      speed = 0;
      brightChange = 0;
    }
    if(bX >= zone1 && bX < zone2){ //mid-screen bouncing range
      goBounce = true;
      brightChange = 2;
    }
    if(bX >= zone2 && bX <= end){ //explosive ending
      goBounce = false;
      brightChange = 4;
      speed = 7;
      angle *= 1.01;

      if(bY <= border || bY >= height-border){//top or bottom edge of the screen
        angle=0;
        speed = 0;
        brightChange = 0;
      }
    }
  }
}

