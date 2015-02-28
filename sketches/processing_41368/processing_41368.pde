
int num = 800;
PImage collage;
Path[] myPath = new Path [num];


void setup () {
  size (500, 300);

  background (0);
  collage = loadImage("collage.jpg");
  smooth ();

  for (int i=0; i<myPath.length; i++) {
    myPath[i] = new Path();
  }
}

void draw () {
  for (int i=0; i < myPath.length; i++) {
    myPath[i].update();
    myPath[i].display();
  }
}
class Path {
  int a= int(random(width));  //placement of "a" coordinate
  int b= int(random(height)); //placement of "b" coordinate


  void update() {   //draw a or b again.
    a = a + int(random(0, 0));
    b = b + int(random(2, 2)); //makes the path horizontal
  }

  void display() {

    color t = collage.get (a, b);    //gets colors from image behind
    stroke (t);
    //fill(t);
    strokeWeight(random(4)); //sets random dot size between 1 and 3
    point(a, b);
    //ellipse (a, b, 10, 10);
  }
}

//


