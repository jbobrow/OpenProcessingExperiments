
Starfield starfield;

void setup() {
    size(300, 300);
    starfield = new Starfield();
}

void draw() {
    background(0);
    starfield.draw();
}


class Starfield {
  ArrayList stars;
  
  Starfield() {
    stars = new ArrayList();
    for (int i = 0; i < 100; i++) {
      Star s = new Star();
      s.x = random(0, width);
      s.y = random(0, height);
      s.size = random(1, 5);
      stars.add(s);
    }
  }
  
  void draw() {
    for (int i = 0; i < stars.size(); i++) {
      Star s = (Star)stars.get(i);
      s.y += s.size;
      fill(255);
      ellipse(s.x, s.y, s.size, s.size);
      if (s.y > height+10) {
        s.x = random(0, width);
        s.y = random(-30, 0);
        s.size = random(1, 5);
      }
    }
  }
}

class Star {
  float x;
  float y;
  float size;
}
