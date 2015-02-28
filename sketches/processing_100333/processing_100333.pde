
import java.util.ArrayList;
ArrayList<Explosion> exps = new ArrayList<Explosion>();

float x;
float y;
float spd;
float sign;

void setup() {
  size(400, 400);
  background(0);
  smooth();

  if (random(1) >= 0.5) {
    sign = 1;
    x = 0;
  } else {
    sign = -1;
    x = width;
  }
  y = random(height);

  spd = 5;
}

void draw() {
  background(0);

  x += sign * spd;

  for (int i = 0; i < exps.size();i++) {
    Explosion exp = exps.get(i);

    exp.plus();
    exp.display();
    if (exp.finished()) {
      exps.remove(i);
    }
  }

  exps.add(new Explosion(x, y+random(-5, 5)));

  if (x > width + 30 || x < -30) {
    if (random(1) >= 0.5) {
      sign = 1;
      x = 0;
    } else {
      sign = -1;
      x = width;
    }
    y = random(height);
  }
}

class Explosion {
  float x;
  float y;
  float r;
  float r_goal = random(10, 100);
  float alp = 150;
  int life = 200;
  float g = random(255);

  Explosion(float tmpX, float tmpY) {
    x = tmpX;
    y = tmpY;
  }

  void plus() {
    r += 1;
    if (r > r_goal) {
      r = r_goal;
      alp -= 5;
    }
  }

  void display() {
    noStroke();
    fill(255, g, 0, alp);
    ellipse(x, y, r, r);
  }

  boolean finished() {
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}

