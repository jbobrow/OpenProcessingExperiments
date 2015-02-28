
class Ball {
  float x, y; // Position of the ball
  float speedX, speedY; // Speed of the ball
  float radius; // Radius of the ball
  color ball_color = color(0,random(0,250)); // Color of the ball
  int resizeControl = 0;
  int id;

  // Constructor
  Ball(float x_, float y_, float speedX_, float speedY_, float radius_, int id_) {
    x = x_;
    y = y_ ;
    speedX = speedX_;
    speedY = speedY_;
    radius = radius_;
    id = id_;
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
    // change direction when it has a wall collision
    if (x + edge + radius > width || x - edge - radius < 0) {
      speedX = - speedX;
    }
    if (y + edge + radius > height || y -  edge - radius < 0) {
      speedY = - speedY;
    }
  }

  void mouse() {
    int CO = 10;
    if (mousePressed) {
      resizeControl = 1;
      if(mouseButton == RIGHT) {
        if (resizeControl == 1) { 
          if(radius<50 && radicont==1) {
            radius=radius+1;
            notes[1].setGain(0);
            notes[2].setGain(0);
            notes[3].setGain(0);
            notes[4].setGain(0);
            notes[5].setGain(0);
            notes[6].setGain(0);
            notes[7].setGain(0);
            notes[8].setGain(0);
            notes[9].setGain(0);
            notes[10].setGain(0);
            if(radius==49) {
              radicont=0;
            }
          }
          if(radius>10 && radicont==0) {
            radius=radius-1;
            notes[1].setGain(0);
            notes[2].setGain(0);
            notes[3].setGain(0);
            notes[4].setGain(0);
            notes[5].setGain(0);
            notes[6].setGain(0);
            notes[7].setGain(0);
            notes[8].setGain(0);
            notes[9].setGain(0);
            notes[10].setGain(0);
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
  //play sounds when wall collision is present
  void sound() {    
    if (x + edge + radius > width || x - edge - radius < 0) {
      notes[id].loop(0);
      minim.stop();
    }
    if (y + edge + radius > height || y -  edge - radius < 0) {
      notes[id].loop(0);
      minim.stop();
    }
  }
}


