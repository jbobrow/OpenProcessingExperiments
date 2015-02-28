
Skin [] cell = new Skin [560];
Mouse mouse;
int amount = 2;


void setup() {
  size(640, 320);
  for (int x = 40; x < 600; x++) {
    cell[x-40] = new Skin(x, height/2);
  }
  mouse = new Mouse();
}
void draw() {
  background(255);
  beginShape();
  for (Skin i : cell) {
    if (i.intersect(mouse)) {
      i.move(i);
    }
    vertex(i.x, i.y);
    stroke(0);
    noFill();
  }
  endShape();
  mouse.update(mouseX, mouseY);
}

void mousePressed() {
  for (Skin i : cell) {
    i.y = height/2;
  }
}


class Mouse {
  float x, y;
  float r = 20;
  Mouse () {
  }

  void update(float mx, float my) {
    x = mx;
    y = my;
  }
}

class Skin {
  float x, y;
  Skin(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  


  boolean intersect(Mouse m) {
    float d = dist(x, y, m.x, m.y);
    if (d < m.r) {
      return true;
    }
    else {
      return false;
    }
  }

  void move(Skin c) {
    c.y-=random(-amount, amount);
  }
}



