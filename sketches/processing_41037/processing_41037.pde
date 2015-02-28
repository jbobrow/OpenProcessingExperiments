
class Ball {

  float x,y;

  Ball(float x,float y) {
    this.x=x;
    this.y=y;
  }

  void fall() {
    y+=5;
  }

  void draw() {
    noStroke();
    fill(235);
    ellipse(x,y,16,16);
  }
}


