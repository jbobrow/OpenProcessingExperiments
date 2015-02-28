

int xpos;
int ypos;
int w;
int Current;

boolean held = false;

Circle c;

ArrayList circles;

void setup() {
  size(700, 400);
  smooth();

  fill(18, 120, 101, 80);

  circles = new ArrayList();

  circles.add(new Circle(20, 20, 20));
}


void draw() {
  background(255);

  line(50, 0, 50, 50);
  line(50, 100, 50, 250);
  line(50, 300, 50, 400);
  line(50, 50, 150, 50);
  line(50, 100, 100, 100);
  line(50, 250, 100, 250);
  line(150, 0, 150, 50);
  line(100, 100, 100, 200);
  line(100, 200, 150, 200);
  line(100, 250, 100, 350);
  line(150, 100, 150, 150);
  line(150, 200, 150, 300);
  line(100, 350, 200, 350);
  line(150, 100, 200, 100);
  line(150, 150, 200, 150);
  line(150, 300, 300, 300);

  for (int i = circles.size() - 1; i >= 0; i--) {
    Circle c = (Circle) circles.get(i);

    xpos = c.getX();
    ypos = c.getY();

    //experiment here
    c.Display();
  }
}

// Selecting the circle - identifying where the mouse is and if it is inside a circle.

void mousePressed() {

  for (int i = circles.size() - 1; i >= 0; i--) {
    Circle c = (Circle) circles.get(i);

    xpos = c.getX();
    ypos = c.getY();
    w = c.getw();

    if (dist(xpos, ypos, mouseX, mouseY) < w/2) {
      Current = i;
      held = true;

     
    
      }
    }
  }




void mouseDragged() {
  if (held) {

    Circle c = (Circle) circles.get(Current);

    c.Drag();
  }
}


void mouseReleased() {
  if (held) {


    Circle c = (Circle) circles.get(Current);
    c.Drag();
    held = false;
  }
}



