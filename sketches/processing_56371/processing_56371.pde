
class Circle {

  float x, y;
  float r = 40;
  color c;

  int redV;
  int greenV;
  int blueV;
  int alphaV;

  float speedX = random(-2, 2);
  float speedY;
  
  float speed = .5;

  Circle(float x_, float y_, int redV_, int greenV_, int blueV_, int alphaV_) {
    x = x_;
    y = y_;
    redV = redV_;
    greenV = greenV_;
    blueV = blueV_;
    alphaV = alphaV_;
  }

  void display() {
    noStroke();
    fill(redV, greenV, blueV, alphaV);
    ellipse(x, y, r*2, r*2);
  }

  void gravity() {
    speedY = speedY + gravity;
  }
  
  void helium() {
    
    strokeWeight(1);
    stroke(255,255,255,255);
    line(x,y,width/2,height/2);
    
    if (y - r < 0){
      y = r;
    }
    if (x + r > width || x - r < 0){
      speed = speed * -1;
    }
  }

  void bounce() {
    strokeWeight(1);
    stroke(255);
    line(x,y,width/2,height/2);
    y = y + speedY;
    x = x + speedX;
    alphaV = 255;

    if (x + r >= width || x - r <= 0) {
      speedX = speedX * -1;
    }

    if (y + r >= height) {
      speedY = speedY * -0.95;
      y = height - r;
    }
  }
}


