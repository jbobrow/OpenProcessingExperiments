
boolean on = true;
class Walker {
Walker() {
}
int x = 540;
int y = 360;

  void display() {
    stroke(255);
    point(x, y);
}
  void step() {
    int choice = int(random(8));
  if(on) {
    if (choice == 0) {
      x++;
    } else if (choice == 1) {
      x--;
    } else if (choice == 2) {
      y++;
    } else if (choice == 3) {
      y--;
    } else if (choice == 4) {
      y++;
      x++;
    } else if (choice == 5) {
      y--;
      x++;
    } else if (choice == 6) {
      y++;
      x--;
    } else {
      y--;
      x--;
    }
   }
  }
}
Walker w;
void setup() {
  size(1080, 720);
  frame.setResizable(true);
  w = new Walker();
  background(0);
}
void draw() {
  w.step();
  w.display();
}
void mousePressed() {
  if(mouseButton == LEFT) {
    on = !on;
  } else {
    save("pic.png");
  }
}


