
class Ball {

  float x;
  float y;
  int r;
  int lastCollision;
  
  int timer;

  color c;

  float xSpeed;
  float ySpeed;

  Ball(float tempX, float tempY, color tempC) {

    x = tempX;
    y = tempY;
    c = tempC;

    r= round(random(5, 15));

    xSpeed = round(random(-5, 5));
    ySpeed = round(random(-5, 5));

    if (xSpeed == 0)
      xSpeed = 1;
    if (ySpeed == 0)
      ySpeed = 1;
  }

  void move() {

    x += xSpeed*speedMultiplier;
    y += ySpeed*speedMultiplier;
  }

  void display() {

    smooth();
    ellipseMode(CENTER);
    fill(c); 
    ellipse(x, y, r*2, r*2);
  }

  boolean checkBallCollision(Ball a) {

    float distance = dist(x, y, a.x, a.y);

    if (distance <= r + a.r)
    {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean checkBallOverlap(Ball a) {

    float distance = dist(x, y, a.x, a.y);

    if (distance < r + a.r)
    {
      return true;
    }
    else {
      return false;
    }
  }

  void bounce() {

    xSpeed *= -1;
    ySpeed *= -1;
  }
  
  void changeColor(color newC) {
    
    
    c = newC;
    
  }
  
  void reset() {

    xSpeed *= -1;
    ySpeed *= -1;
    x = random(15, 385);
    y = random(15, 285);
    //c = color(random(255), random(255), random(255));
  }


  void checkWallCollision() {

    if (y+r >= height){
      y = height - r -1;
      ySpeed *= -1;
    }
    if ( y-r <= 0)
    {
      y = r+1;
      ySpeed *= -1;
    }
    

    if (x+r >= width){
      x = width - r -1;
      xSpeed *= -1;
    }
    if ( x-r <= 0){
      x = r+1;
      xSpeed *= -1;
    }
  }
}


