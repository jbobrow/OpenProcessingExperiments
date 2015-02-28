
final int NUMBOXES = 10;

Box[] b;

void setup() {
  size(640, 640);
  b = new Box[NUMBOXES];
  for (int i = 0; i < NUMBOXES; i++)
    b[i] = new Box();
}

void draw() {
  background(255);
  for (int i = 0; i < NUMBOXES; i++)
    b[i].draw();
}

class Box {
  PVector pos;
  color c;
  float size, dx, dy;
  boolean moving, once;

  Box() {
    dx = 0;
    dy = 0;
    moving = false;
    pos = new PVector(random(0, 500), random(0, 500));
    c = color(0, 0, 255);
    size = 50;
    once = false;
  }

  void draw() {
    if (mousePressed && containsMouse() || moving) {
      moving = true;
      if (!once) {
        dx = pos.x - mouseX;
        dy = pos.y - mouseY;
        once = true;
      }
      pos.x = mouseX + dx;
      pos.y = mouseY + dy;
      if (!mousePressed) {
        once = false;
        moving = false;
      }
    }
    fill(c);
    rect(pos.x, pos.y, size, size);
  }

  boolean containsMouse() {
    if (mouseX > pos.x && mouseX < pos.x + size && mouseY > pos.y && mouseY < pos.y + size) 
      return true;
    else
      return false;
  }
}



