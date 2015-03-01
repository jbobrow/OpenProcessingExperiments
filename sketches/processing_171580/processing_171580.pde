
OverCircle c = new OverCircle(72, 48, 40);
OverCircle r = new OverCircle(109, 230, 236);
OverCircle b = new OverCircle(372, 348, 20);
OverCircle a = new OverCircle(209, 380, 336);
OverCircle e = new OverCircle(472, 448, 140);
OverCircle f = new OverCircle(409, 230, 100);
OverCircle g = new OverCircle(318, 190, 80);
OverCircle h = new OverCircle(309, 80, 189);
OverCircle i = new OverCircle(472, 248, 40);
OverCircle j = new OverCircle(439, 30, 200);

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(70);
  a.update(mouseX, mouseY);
  a.display();
  r.update(mouseX, mouseY);
  r.display();
  c.update(mouseX, mouseY);
  c.display();
  b.update(mouseX, mouseY);
  b.display();
  e.update(mouseX, mouseY);
  e.display();
  f.update(mouseX, mouseY);
  f.display();
  h.update(mouseX, mouseY);
  h.display();
  i.update(mouseX, mouseY);
  i.display();
  j.update(mouseX, mouseY);
  j.display();
  g.update(mouseX, mouseY);
  g.display();
}

class OverCircle {
  int x, y; // The x- and y-coordinates
  int diameter; // Diameter of the circle
  int gray; // Gray value
  
  OverCircle(int xp, int yp, int d) {
    x = xp;
    y = yp;
    diameter = d;
    gray = 0;
  }

  void update(int mx, int my) {
    if (dist(mx, my, x, y) < diameter/2) {
      if (gray < 250) {
        gray++;
      }
    } else {
        if (gray > 0) {
          gray--;
        }
    }
   }

  void display() {
    fill(gray);
    ellipse(x, y, diameter, diameter);
  }
}



