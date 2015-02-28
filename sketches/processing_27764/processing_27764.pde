
class Ball {
  float x, y; // Position of the ball
  float speedX, speedY; // Speed of the ball
  float radius; // Radius of the ball
  color ball_color = color(0,random(0,250)); // Color of the ball
  int resizeControl = 0;

  // Constructor
  Ball(float x_, float y_, float speedX_, float speedY_, float radius_) {
    x = x_;
    y = y_ ;
    speedX = speedX_;
    speedY = speedY_;
    radius = radius_;
  }


  // Draws the ball
  void display() {
    fill(ball_color);
    stroke(ball_color);
    ellipse(x, y, radius * 2, radius * 2);
  }

  // Updates the ball's position, and reverses speed if it hits the wall
  void update() {
    x = x + speedX* mouseY/100;
    y = y + speedY* mouseY/100;     
    // Reverse speed if it hits the wall

    if (x + edge + radius > width || x - edge - radius < 0) {
      speedX = - speedX;
      note1 = minim.loadFile("note1.wav");
      note1.loop(0);
      minim.stop();
    }
    if (y + edge + radius > height || y -  edge - radius < 0) {
      speedY = - speedY;
      note1 = minim.loadFile("note1.wav");
      note1.loop(0);
      minim.stop();
    }
  }

  void mouse() {
    if (mousePressed) {
      resizeControl = 1;
      if(mouseButton == RIGHT) {
        if (resizeControl == 1) { 
          if(radius<50 && radicont==1) {
            radius=radius+1;
            if(radius==49) {
              radicont=0;
            }
          }
          if(radius>10 && radicont==0) {
            radius=radius-1;
            if(radius==11) {
              radicont=1;
            }
          }
        }
      }
      else if (mouseButton == LEFT) {    
        resizeControl = 0;
      }
    }
  }
  //  void sound() {    
  //  
  // play sound if it hits the wall
  //if (x + edge + radius > width || x - edge - radius < 0) {
  //}
  //if (y + edge + radius > height || y -  edge - radius < 0) {
  //note1.play();
  //minim.stop();
  //}
  //}
}


