
class Bubble {
  final static int INITIAL_OPACITY = 128;
  final static int DEFAULT_TTL = 4000;
  PVector loc;

  PVector vel = new PVector(0, 0, 0);
  PVector acc = new PVector(0, -0.8, 0);
  int diameter;
  int opacity = INITIAL_OPACITY;

  boolean hasToDie = false;

  Glass parent;

  boolean active = false;
  int activeAfterMillis;
  Bubble(Glass parent) {
    this.parent = parent;
    diameter = int(random(30, 65));
    loc = new PVector(random(parent.x + (diameter >> 1), parent.x + parent.width - (diameter >> 1)), random(parent.y, parent.y + parent.height));

    activeAfterMillis = int(random(0, 100));
  }

  Bubble(Glass parent, int x, int y, int diameter) {
    this.parent = parent;
    this.diameter = diameter;
    loc = new PVector(x, y); 
    activeAfterMillis = int(random(0, 100));
  }

  void update() {
    activeAfterMillis--;
    if (active) {
      vel.add(acc);

      loc.add(vel);
    } 
    else if (activeAfterMillis <= 0) {
      active = true;
      opacity /= 2.5;
    }
  }

  void paint() {
    if (hasToDie)
      return;

    fill(255, opacity);
    ellipse(loc.x, loc.y, diameter, diameter);
  }
}





