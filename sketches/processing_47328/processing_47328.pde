
// Simple bouncing ball class


class Ball {
  float x;
  float y;
  float speedx;
  float speedy;
  float gravityx;
float gravityy;
  float w;
  float life = 300;
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speedx = 0;
    speedy = 0;
    gravityx = .09*abs(tempX - height/2);
    gravityy = .09*abs(tempY - width/2);
  }
  
    void move() {
    // Add gravity to speed
    speedx = speedx + gravityx;
    speedy = speedy + gravityy;
    // Add speed to y location
    y = y + speedy;
    x = x + speedx;
    // If square reaches the bottom
    // Reverse speed
   if (y > height) {
       //Dampening
      speedy = speedy * -1;
      y = height;}
      
      if (x > height) {
      // Dampening
      speedx = speedx * -1;
       
   }
     //if (x > width) {
      // Dampening
      //speedx = speedx * -0.8;
      //}
      
     // if (x < width) {
      // Dampening
     // speedx = speedx * -0.8;
    // }

     if (y>height/2) {
       gravityy = gravityy*.4;
     }
     if (y<height/2) {
       gravityy = gravityy*-1;
     }
     if (x>width/2) {
       gravityx = gravityx*1;
     }
     if (y<width/2) {
       gravityx = gravityx*-1;
     }
  }
  
  boolean finished() {
    // Balls fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    // Display the circle
    fill(random(0),random(255),random(255));
    //stroke(0,life);
    ellipse(x,y,w,w);
  }
}  

