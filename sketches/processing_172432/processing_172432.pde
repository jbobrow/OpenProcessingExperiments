
/* @pjs crisp=true; preload="starry.jpg"; */


ArrayList<Shapes> shapes = new ArrayList<Shapes>();
PImage img;
int w = 350;
int h = 350;

void setup() {
  img = loadImage("starry.jpg");
  println("width: " + w + " height: " + h);
  size(350, 350);
  background(0);
  noStroke();
  strokeWeight(2);
  smooth();
  frameRate(20);
  noFill();
}

void draw() {
  background(0);

  //draw shapes using arraylist and for loop
  for (int i = 0; i < shapes.size (); i++) {
    Shapes s = shapes.get(i);
    s.display();
  }
}

//shapes are drawn when the mouse is moving
//shaped are added using append
//draw square by default
//draw circles when mouse is clicked and dragged
void mouseMoved() {
  shapes.add(new Shapes(mouseX, mouseY, 1));// 1 = drawing squares
}

void mouseDragged() {
  shapes.add(new Shapes(mouseX, mouseY, 0));// 0 = drawing circles
}

class Shapes {

  float xpos, ypos;
  int shapes;// 0 = circle; 1 = square
  color c;
  float m;//circle size
  float n;//square size

  Shapes(float _x, float _y, int _shapes) {
    xpos = _x;
    ypos = _y;
    shapes = _shapes;
    c = img.get(mouseX, mouseY);
  }

  void display() {
    m = random(7, 13);//random and changing diameters
    n = random(7, 13);//random and changing sides
    stroke(c);
    if (shapes == 0) {
      ellipse(xpos, ypos, m, m);
    } else if (shapes == 1) {
      rect(xpos, ypos, n, n);
    }
  }
}//class Shapes



