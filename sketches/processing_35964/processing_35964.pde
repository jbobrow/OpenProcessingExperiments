

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
  noStroke();
  fill(18, 120, 101, 80);

  circles = new ArrayList();

  circles.add(new Circle(50, 50, 50));
  circles.add(new Circle(100, 50, 60));
  circles.add(new Circle(100, 100, 50));
  circles.add(new Circle(100, 150, 60));
  circles.add(new Circle(200, 200, 70));
  circles.add(new Circle(200, 250, 50));
  circles.add(new Circle(300, 70, 75));
  circles.add(new Circle(300, 100, 40));
  circles.add(new Circle(600, 40, 50));
  circles.add(new Circle(650, 350, 50));
  circles.add(new Circle(100, 300, 60));
  circles.add(new Circle(650, 70, 50));
  circles.add(new Circle(400, 100, 60));
  circles.add(new Circle(50, 200, 50));
}


void draw() {
  background(255);

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



