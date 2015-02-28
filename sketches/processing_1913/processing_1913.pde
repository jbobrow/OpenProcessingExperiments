
//The ball class

class Ball {
  
  float r; // radius
  float x,y;
  float xspeed,yspeed;
  
  // Constructor that makes it easy to increase or decrease ball speed to alter difficulty
  Ball(float ballhori, float ballvert) {
  
    x = 200;
    y = 200;
    xspeed = ballhori;
    yspeed = ballvert;
  }
  
  //Controls ball speed
  void move() {
    x += xspeed; 
    y += yspeed; 
    
    // Check horizontal edges
    if (x > width + 5  || x < 0 - 5) {
      xspeed *= - 1;
    }
    //Resets the ball if it glitches out or scores a point
    if (x > width + 30 || x < 0 - 30 || y > height || y < 0) {
      x = random(300,500);
      y = random(350);
  }
  }
  
  //Bounces the ball when it hits a normal bumper
  void bounce() {
    xspeed *= -1.004;
    yspeed *= -1;
  
  }
  //Bounces the ball when it hits the middle bumper.
  void rbounce() {
    xspeed *= random(-1.0010, -0.96);
  }
 
 //Displays the ball
  void display() {
    r = 15;
    stroke(0);
    fill(0);
    ellipse(x,y,r*2,r*2);
  }
}


