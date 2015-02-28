
Ball ball = new Ball(100, 100, 100);

void setup() {
  size( 400, 400);
  background(0);
}

void draw() {
  ball.action();
}

class Ball {
  float d;
  float h;
  float aD;
  float f = random(5) + 3;
  
  Ball( float inid, float inih, float iniaD) {
    d = inid;
    h = inih;
    aD = iniaD;
  }
  
  void action() {
    fill(random(255), random(255), random(255));
    noStroke();
    if ( key == CODED && keyPressed == true) {
      if ( keyCode == UP) {
        h = h - f;
      } else if ( keyCode == DOWN){
        h = h + f;
      } else if (keyCode == LEFT){
        d = d - f;
      } else if (keyCode == RIGHT){
        d = d + f;
      }
    }
    ellipse( d, h, aD + random(10), aD + random(10));
  }
}
