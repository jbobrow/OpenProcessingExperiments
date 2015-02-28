
myBall[] ball= new myBall[20];
 
void setup() {
  size(500, 500);
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
  
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float mysize;
 
  // constructor
  myBall () {
    xpos = random(500);
    ypos = random(500);
    xspeed = random(1,5);
    yspeed = random(1,5);
    mysize = (25);
  }
 
  // methods (behavior)
  void move() {
    if (xpos > 500 || xpos-(mysize/2) < 0) {
      xspeed = xspeed * (-1);
    }
    if (ypos+(mysize/2) > 500 || ypos-(mysize/2) < 0) {
      yspeed = yspeed * (-1);
    }
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
  }
 
  void display() {
    ellipse(xpos, ypos, mysize, mysize);
  }

}



