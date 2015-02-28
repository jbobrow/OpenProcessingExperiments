
class Ball {
  float x;
  float y;

  float w;
  float h;



  float xVel;
  float yVel; 

  float r, g, b;

  PImage pic;

  void setupBall(float n, float v) {

    pic = loadImage("asteroid.png");
    x=n;
    y=v;
    w= (50);
    h= (50);

    yVel = random(4, 8);
    xVel = random(-8, 8);
  }

  void updateBall() {
    x+=xVel;
    y+=yVel;



    if (y> height) {
      y=random(0, 50);
    }

    if (x>width) {
      x=random(0, 50);
    }
  }

  void drawBall() {


    image(pic, x, y);
  }
}


