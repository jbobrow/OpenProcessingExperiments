
//magic erasers

int num = 200;
PImage pic;

Path[] myPath = new Path [num];


void setup() {
  pic = loadImage("spring.jpg");
  size(300, 300);
  background(200);
  smooth();
  
  for (int i=0; i<myPath.length; i++) {
    myPath[i] = new Path();
  }
}


void draw() {

  for (int i=0; i < myPath.length; i++) {


    myPath[i].update();
    myPath[i].display();
  }
}


class Path {


  int x = int(random(width));
  int y = int(random (height));

  Path() {
  }

  void update() {
    x = x + int(random (-4, 4));
    y = y + int(random (-4, 4));
  }


  void display() {
    color c = pic.get(x, y); //get colors of each point from color of image of corresponding point
    stroke(c);
    point (x, y);
  }
}

