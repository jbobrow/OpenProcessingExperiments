
class Ball {

  float x;
  float y;

  float dia;

  Ball(float _x, float _y) {
    this.x = _x;
    this.y = _y;
  }

  void display() {
    if (good(int(x),int(y)) == true) {
      fill(0);
      //stroke(229,200,70);
      stroke(255);
    }
    else{
      noFill();
      noStroke();
    }
    ellipse(x, y, 40, 40);
  }
}


