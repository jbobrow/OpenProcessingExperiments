
int count = 30; //number of points
PImage img;

Crazy[] follow = new Crazy [count];


void setup() {
  img = loadImage("tree.jpg");
  size(300, 300);
  background(0);
  smooth();
  strokeWeight(2);

  for (int i=0; i<follow.length; i++) {
    follow[i] = new Crazy(); // feeds the code
  }
}


void draw() {

  for (int i=0; i < follow.length; i++) {
    follow[i].update();
    follow[i].display();
  }
}


class Crazy { //starting area
  int x = int(225); 
  int y = int(50);
  Crazy() {
  }

  void update() { //spread rate
    x = x + int(random (-6, 6));
    y = y + int(random (-6, 6));
  }

  void display() {
    color c = img.get(x, y); 
    stroke(c);
    point (x, y);
  }
}


