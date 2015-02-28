
import java.util.ArrayList;
ArrayList<Chaser> chasers = new ArrayList<Chaser>();

boolean fBegin = false;

void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw() {
  background(0);

  if (!fBegin) { 
    return;
  }

  for (int i = 0; i < chasers.size();i++) {
    Chaser chaser = chasers.get(i);

    chaser.plus();
    chaser.display();
    if (chaser.finished()) {
      chasers.remove(i);
    }
  }

  if (mouseX != pmouseX || mouseY != pmouseY) {
    chasers.add(new Chaser(mouseX, mouseY));
  }
}

void mouseMoved() {
  if (!fBegin && pmouseX != mouseX) {
    fBegin = true;
  }
}

class Chaser {
  float x;
  float y;
  float r;
  float r_goal = random(10, 100);
  float alp = 150;
  int life = 400;

  Chaser(float tmpX, float tmpY) {
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
    fill(255, alp);
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



