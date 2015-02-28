
ArrayList<Ball> ballz = new ArrayList<Ball>();

void setup() {
  background(#80E3F0);
  size(500, 500);
  //  ballz = new Ball(color(200),random(width),random(height),(-5,5),(-5,5));
}

void draw() {
  background(#80E3F0);
  smooth();
  for (int i=0; i<ballz.size(); i++) {
    Ball b = ballz.get(i);
    b.display();
    b.bounce();
    if (b.transx <= 0) {
      ballz.remove(i);
      i--;
    }
  }
  if (mousePressed) {
    ballz.add(new Ball());
  }
}

class Ball {

  float x, y;
  float xspeed;
  float yspeed;
  float transx=1000;

  Ball() {
    x = mouseX;
    y = mouseY;
    xspeed = random(-20, 20);
    yspeed = random(-20, 20);
    transx = 100;
  }

  void display() {
    fill(250, 100, 0, transx);
    noStroke();
    ellipse(x, y, 50, 50);
  }

  void bounce() {
    x+=xspeed;
    y+=yspeed;
    if (x>width-25) {
      xspeed*=-1;
      transx-=15;
    }
    if (x<0+25) {
      xspeed*=-1;
      transx-=15;
    }
    y+=yspeed;
    if (y>height-25) {
      yspeed*=-1;
      transx-=15;
    }
    if (y<0+25) {
      yspeed*=-1;
      transx-=15;
    }
    xspeed*=.99;
    yspeed*=.99;
    //    if (xspeed<2 && xspeed>-2) {
    //      xspeed=1;
    //    }
  }
}



