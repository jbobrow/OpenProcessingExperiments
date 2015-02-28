
class Stripe {

  float x;
  color c = color(random(255), random(255), random(255), 100);
  float w;
  float speed = random(3,7);
  boolean moused = false;

  Stripe() {
    x = 0;
    w = random (120);
  }

  void displayStripe() {
    if (moused) {
      fill(255);
    } 
    else {
      fill(c);
    }
    rect(x, 0, w, height);
  }

  void moveStripe() {
    x = x + speed;
    if (x > width) {
      x = 0;
      speed = random(3,7);
      w = random(120);
      c = color(random(255), random(255), random(255), 100);
    }
  }

  void rollOver() {

    if (mouseX > x && mouseX < x + w) {
      moused = true;
    }
    else {
      moused = false;
    }
  }
}


