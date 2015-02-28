
class Ball {  

  float x, y;
  int ballRadius;

  Ball(int tempBallRadius) {
    ballRadius =  tempBallRadius; 
    this.x = x;
    this.y = y;
  }

  //methods
  void display() {
    ellipseMode(CENTER);
    fill(0,0,0,0);
    ellipse(x, y, ballRadius*2, ballRadius*2);
  }
}


