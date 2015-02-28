
class Body { 
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float a = 0;
  boolean grouped = false;
  boolean moving = false;
  int interMove = int(random(10*frameRate));
  int cnt = 0;

  Body(float cX, float cY, float xSpd, float ySpd) { 
    x = cX;
    y = cY;
    xSpeed = xSpd;
    ySpeed = ySpd;
    moving = false;
  }

  void display() {
    noStroke();
    ellipseMode(RADIUS);
    pushMatrix();
    translate(x, y);
    rotate(a);
    fill(50);
    ellipse(0, 0, 37, 52);
    fill(70);
    ellipse(0, 0, 22, 22);
    popMatrix();
  }

  void move() {
    if(cnt>=interMove){
      moving = !moving;
      cnt = 0;
      interMove = int(random(10*frameRate));
      xSpeed = 1+random(2);
      ySpeed = 1+random(2);
    }
    cnt++;
    if(moving){
      x += xSpeed;
      y += ySpeed;
      a = atan2(ySpeed, xSpeed);
      if (x > width || x < 0 ) {
        xSpeed *= -1;
      }
      if (y > height || y < 0 ) {
        ySpeed *= -1;
      }
    }   
  }
}


