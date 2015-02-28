
class Ball {
  float X;
  float Y;
  float speed;
  float dia;
  float c;

  Ball (float X, float Y) {
    this.X = X;
    this.Y = Y;
    speed = random(0.1, 5);
    dia = random(50, 100);
  }

  void display() {
    noStroke();
    ellipse(this.X, this.Y, dia, dia);
  }

  void drop() {
    this.Y = this.Y + speed;
    speed = speed + gravity;

    if (this.Y >= height-120) {
      speed *= -0.90;
    }
  }
}




