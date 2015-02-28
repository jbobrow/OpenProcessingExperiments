
int num = 30;
PImage flower;
Dots [] myDots = new Dots[num];

void setup() {
  flower = loadImage("nature.jpg");
  size(300, 300);
  background(0);
  smooth();
  loadPixels();
  updatePixels();
  for (int i=0;i<myDots.length;i++) {
    myDots[i] = new Dots();
  }
}

void draw() {
  for (int i=0; i<myDots.length; i++) {
    myDots[i].update();
    myDots[i].display();
  }
}


class Dots {
  int x = int (random(width));
  int y = int (random(height));

  Dots() {
  }

  void update() {
    x = x + int (random(-5, 5));
    y = y + int (random(-5, 5));
  }

  void display() {
    color c = flower.get(x,y);
    stroke(c);
    smooth();
    noFill();
    ellipse(x, y, 5, 5);
  }
}


