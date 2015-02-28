
class Ball {

  //variables
  float x;
  float y;
  float radius;
  float velocityX;
  float velocityY;
  float gravity;
  float bounciness;

  //constructor 
  Ball( float newX, float newY, float newRadius ) {
    x = newX;
    y = newY;
    radius = newRadius;

    velocityX = random(2,4);
    velocityY = random(2,4);
    gravity = 0.5;
    bounciness = 0.9;
  }

  //ball drawing
  void render() {
    strokeWeight(3);
    fill(220);
    ellipse( x, y, radius * 2, radius * 2 );
  }

  //ball movement
  void move() {
    x = x + velocityX;
    y = y + velocityY;

    if ((x + radius) > width) {
      velocityX = velocityX * -1.0 * bounciness;
      velocityY = velocityY * bounciness;
      x = width - radius;
    }
    else if ((x - radius) < 0) {
      velocityX = velocityX * -1.0 * bounciness;
      velocityY = velocityY * bounciness;
      x = radius;
    }
    if ((y + radius) > height) {
      velocityX = velocityX * bounciness;
      velocityY = velocityY * -1.0 * bounciness;
      y = height - radius;
    }
    else if ((y - radius) < 0) {
      velocityX = velocityX * bounciness;
      velocityY = velocityY * -1.0 * bounciness;
      y = radius;
    }

    velocityY = velocityY + gravity;
  }
  
  //click to reset sketch
  void reset(float a, float b, float c) {
    x = a;
    y = b;
    radius = c;
    
    
  }
}


