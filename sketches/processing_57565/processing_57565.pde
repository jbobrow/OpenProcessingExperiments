
PImage lally;
Circle circle1;

int xpos, ypos;

int r = 0;


void setup() {
  xpos = width/2;
  ypos = height/2;
  size(800, 800);
  lally = loadImage("lallyknob.png"); 
  circle1 = new Circle(10, 10);
}

void draw() {
  background(255);
  circle1.display();
  circle1.update(mouseX, mouseY);
}

void mouseDragged() {
  circle1.rotations();
}

class Circle {
  int x, y;
  boolean over;
  Circle(int _x, int _y) {
    x = _x;
    y = _y;
    over = false;
  }
  void rotations() {
    r++;
  }
  void update(int mx, int my) {
    if (dist(mx, my, x, y) < 400) {

      //over = true;
    } 
    else {
      over = false;
    }
  }
  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(r));

    imageMode(CENTER);
background(r);
    image(lally, x, y, 400, 400);

    popMatrix();
  }
}






