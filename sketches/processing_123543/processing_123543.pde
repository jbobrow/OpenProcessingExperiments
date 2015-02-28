
ArrayList<Ball> balls= new ArrayList<Ball>();
void setup() {
  size (600, 400);
  //  for (int i = 0; i <30; i++) {
  //    balls.add(new Ball());
}
void draw() {
  background(0);
  for (int i = 0; i <balls.size(); i++) {
    Ball b = balls.get(i);
    b.move();
    b.display();
    if (b.alpha <=0) {
      balls.remove(i);
      i =i-1;
    }
  }
    if (mousePressed) {
      balls. add(new Ball());
    }
  }

class Ball {
  float x, y;
  float mx, my;
  color alpha;
  Ball() {
    x= mouseX;
    y= mouseY;
    mx= random(-20, 20);
    my= random(-20, 20);
    alpha = 60;
  }

  void display () {
    fill(random(255),random(255), alpha);
    ellipse (x, y, 100, 100);
  }
  void move() {
    x+=mx;
    y+=my;
    if (x<0||x>width) {
      mx*=-.95;
      alpha--;
    }
    if (y<0||y>height) {
      mx*=.95;
         alpha--;
    }
  }
}



