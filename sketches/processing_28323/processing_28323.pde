
class Ball {
  
  float x, y;
  
  final float size = 20;
  
  boolean right = true, down = true;
  
  final boolean paddleRight, paddleDown;
  
  Ball(boolean paddleRight, boolean paddleDown) {
    this.paddleRight = paddleRight;
    this.paddleDown = paddleDown;
    
    x = paddleRight ? width : 0;
    y = paddleDown ? height : 0;
  }
  
  void move() {
    if (right) {
      x += BALL_SPEED;
    } else {
      x -= BALL_SPEED;
    }
    
    if (down) {
      y += BALL_SPEED;
    } else {
      y -= BALL_SPEED;
    }
    
    if (x <= 0) {
      right = true;
      x = 0;
      congalow.loop(0);
    } else if (x >= width) {
      right = false;
      x = width;
      //congahigh.loop(0);
    }

    
    if (y <= 0) {
      down = true;
      y = 0;
      congalow.loop(0);
    } else if (y >= height) {
      down = false;
      y = height;
     //congahigh.loop(0);
    }
    
    if (!paddleRight && x >= paddleX) {
      right = false;
      x = paddleX;
//congahigh.loop(0);
        
      
    } else if (paddleRight && x <= paddleX) {
      right = true;
      x = paddleX;
      
  congahigh.loop(0);
  }
    
    
    if (!paddleRight && x >= paddleX) {
      right = false;
      x = paddleX;
   cowhigh.loop(0);
  } else if (paddleRight && x <= paddleX) {
      right = true;
      x = paddleX;
 //  cowlow.loop(0);
  }
    
 
   if (!paddleDown && y >= paddleY) {
      down = false;
      y = paddleY;
     
      congalow.loop(0);
    }
    else if (paddleDown && y <= paddleY) {
      down = true;
      y = paddleY;
 //  cowlow.loop(0);
 
  }
 
 
 
  }
  
  
  void draw() {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
  
}

