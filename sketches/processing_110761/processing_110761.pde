
class Dot {
  int i;
  int j;
  float goal_r;
  float r;
  float hue = random(360);
  float theta = random(TWO_PI);

  Dot(int tmpI, int tmpJ, float tmpR) {
    i = tmpI;
    j = tmpJ;
    goal_r = tmpR;
  }

  void display() {
    r = goal_r * abs(sin(theta));

    noStroke();
    fill(hue, 80, 100);
    ellipse(i*goal_r+r/2, j*goal_r+r/2, r, r);

    theta += 0.03;
  }
}


