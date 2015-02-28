
class Flower {
  int flower_val = 12;
  float S = 0;
  float S_spd = random(0.1, 0.4);
  float S_goal = random(3, 5);
  float x = random(width);
  float y = random(height);
  float theta = random(TWO_PI);
  float theta_spd = random(0.01, 0.05);
  float hue = random(180);
  float alp = 255;

  Flower() {
  }

  void expansion() {
    S += S_spd;
    theta += theta_spd;

    if (S > S_goal) {
      alp -= 10;
      if (alp < 0) {
        x = random(width);
        y = random(height);
        hue = random(180);

        S = 0;
        alp = 255;
      }
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);

    for (int i = 0 ; i < flower_val;i++) {
      if (i % 2 == 0) {
        fill(hue, 100, 80, alp);
        stroke(hue, 100, 80, alp);
      }
      else {
        fill(hue+180, 100, 80, alp);
        stroke(hue+180, 100, 80, alp);
      }

      h.setBackgroundColour(color(360, 0));

      pushMatrix();
      translate(0, 0);
      rotate(radians(360*i/flower_val));
      h.quad(0, 0, -1*S, -5*S, 0, -6*S, 1*S, -5*S );
      popMatrix();
    }
    popMatrix();
  }
}


