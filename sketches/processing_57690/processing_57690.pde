
// SIMONE ROTH - PS3 # 2 //

class Ball {

  float baX;
  float baY;
  float baC;

  float speed;
  float gravity;
  float wh;

  Ball(color tempC, float tempX, float tempY) {

    baX = tempX;
    baY = tempY;
    baC = tempC;
    
    speed = random(0.1,10);
    wh = map(speed, 0.1, 10, 15, 75);
    gravity = 0.1;

    
  }

  void displayBall() {

    fill(baC);
    ellipse(baX,baY, wh, wh);
  }

  void moveBall() {
    if (animate == true) { 
      baY = baY + speed;
      speed = speed + gravity;
      if (baY >= height-wh/2) {
        speed *= -0.9;
      }
    }
  }
}



