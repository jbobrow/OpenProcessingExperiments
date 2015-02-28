
class Fly {
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float Flysize;
  PImage ima;
  //PImage ima2;
  //PImage ima3;

  Fly(float tempXpos, float tempYpos, float tempXspeed, float s) {
    xpos=tempXpos;
    ypos=tempYpos;  
    xspeed=tempXspeed;
    yspeed=tempXspeed;
    Flysize=s;
    ima=loadImage("fly.png");
    //ima2=loadImage("fly2.png");
    //ima3=loadImage("fly3.png");
  }

  void move() {
    xpos += xspeed;
    ypos += yspeed;
  }

  void bounce() {
    if ((xpos>=width) || (xpos<=0)) {
      xspeed=xspeed*-1;
    }
    if ((ypos>=height) || (xpos<=0)) {
      yspeed=yspeed*-1;
    }
  }

  void display() {
    image(ima, xpos, ypos, Flysize, Flysize);
    //image(ima2, xpos+200, ypos+100, Flysize, Flysize);
    //image(ima3, xpos-200, ypos-100, Flysize, Flysize);
  }
}


