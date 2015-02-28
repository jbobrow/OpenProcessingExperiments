
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
      fill(random(255), random(51), random(51));
      //stroke(229,200,70);
      stroke(255);
    }
    else{
      fill(random(255), random(51), random(51));
      noStroke();
    }
    ellipse(x, y, 40, 40);
  }
}


