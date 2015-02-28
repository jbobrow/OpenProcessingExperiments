
class Ball {
  float x;
  float y;

  float xVel;
  float yVel;

  float w;
  float h;

  float r;
  float g;
  float b;

  void setupBall() {
    x = random(width);
    y = random(height);
    w = (50);
    h = (50);

    r = random(255);
    g = random(0);
    b = random(0);

    xVel = random(-3, 3);
    yVel = random(-3, 3);
  }

  void drawBall() {
    fill(r, g, b);
    ellipse(x, y, w, h);
  }

  void moveBall() {
    x+=xVel;
    y+=yVel;

    if (x < w/2 || x > width-w/2) {
      xVel = -xVel;
      changeColor();
    }

    if (y < h/2 || y > height-h/2) {
      yVel = -yVel;
      changeColor();
    }
    
//    if (dist (x,y, mouseX, mouseY) <= 10){
//      x=mouseX;
//      y=mouseY;
//    }
    
    
  }

  void changeColor() {
    r = random(255);
    g = random(0);
    b = random(0);
}

}


