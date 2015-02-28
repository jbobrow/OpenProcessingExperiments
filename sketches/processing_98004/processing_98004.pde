
class Ball {
  //All those variables
  float x;
  float y;
  float r = 20.0;

  float velocityX = 5.0;
  float velocityY = -2.0;
  float wallLeft = 0.0;
  float wallRight = 600.0;
  float wallTop = 0.0;
  float wallBottom = 600.0;
  float bounciness = 0.90;
  float friction = 0.995;
  float bx = 300;
  float by = 300;

  //definition of ball
  Ball(float newX, float newY, float newVelocityX, float newVelocityY) {
    x = newX;
    y = newY;

    velocityX = newVelocityX;
    velocityY = newVelocityY;
  }

  void display() {

    //ball drawing
    stroke(0);
    fill(129, 230, 200);
    ellipse(x, y, r*2, r*2);
  }

  void move() {

    //x velocity and bounciness
    x = x + velocityX;
    if (x > width) {
      x = 0;
    }
    if ((x + r) > wallRight) {
      velocityX = velocityX * -1.0 * bounciness;
      x = wallRight - r;
    }

    else if ((x - r) < wallLeft) {
      velocityX = velocityX * -1.0 * bounciness;
      x = wallLeft + r;
    }

    //y velocity and bounciness
    y = y + velocityY;
    if ((y + r) > wallBottom) {
      velocityY = velocityY * -1.0 * bounciness;
      y = wallBottom - r;
    }
    else if ((y - r) < wallTop) {
      velocityY = velocityY * -1.0 * bounciness;
      y = wallTop + r;
    }

    //collision test
    float vx = x - mouseX;
    float vy = y - mouseY;

    float v_length = sqrt( (vx * vx) + (vy * vy) );
    float vx_norm = vx / v_length;
    float vy_norm = vy / v_length;

    float range = 80.0;
    float strength = map( v_length, 0.0, range, 1.0, 0.0 );
    strength = constrain( strength, 0.0, 1.0 );
    float fx = vx_norm * strength * 10.0;
    float fy = vy_norm * strength * 10.0;

    velocityX = velocityX * friction +fx;
    velocityY = velocityY * friction +fy;
  }
}


