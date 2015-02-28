
// bouncing balls
myBall[] ball= new myBall[15];
 
void setup() {
  size(400, 400);
  noStroke();
  smooth();
  for (int i = 0; i < ball.length; i++) {
    ball[i] = new myBall();
  }
}
 
void draw() {
  background(255);
  for (int i = 0; i < ball.length; i++) {
    ball[i].move();
    ball[i].display();
  }
}
 
class myBall {
  // attributes
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float mysize;
 
  // constructor
  myBall () {
    c = color(random(50,255), random(50,255), random(50,255), random(100,200));
    xpos = random(400);
    ypos = random(400);
    xspeed = random(1,5);
    yspeed = random(1,5);
    mysize = random(10,200);
  }
 
  // methods (behavior)
  void move() {
    if (xpos+(mysize/2) > 400 || xpos-(mysize/2) < 0) {
      xspeed = xspeed * (-1);
    }
    if (ypos+(mysize/2) > 400 || ypos-(mysize/2) < 0) {
      yspeed = yspeed * (-1);
    }
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
  }
 
  void display() {
    fill(c);
    ellipse(xpos, ypos, mysize, mysize);
  }
}
