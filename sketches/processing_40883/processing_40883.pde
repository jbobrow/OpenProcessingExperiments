

int num =300;
Point[] sethPoint = new Point[num];
color[] sethColor = new color[4];        //Defines the variables and color palette

void setup() {
  size(300, 300);
  background(1);
  smooth();

  sethColor[0] = color(87, 115, 73, 50);
  sethColor[1] = color(199, 190, 126, 50);
  sethColor[2] = color(39, 64, 25, 50);
  sethColor[3] = color(63, 127, 124, 50);


  for (int i=0; i < sethPoint.length; i++) {        //Seeding the array
    sethPoint[i] = new Point();
  }
}

void draw () {

  for (int i=0; i< sethPoint.length; i++) {
    sethPoint[i].update();
    sethPoint[i].draw();
  }
}


class Point {                                //creating the class of vertical points
  color col = sethColor[int(random(0, 3))];
  int x = int(random(width));
  int y = int(0);

  Point() {
  }

  void update() {
    x = x + int(random(-1, 1));
    y = y + int(random(-20, 20));
  }

  void draw() {
    stroke (col);

    strokeWeight (3);
    point(2  * x, .2 * y);
  }
}


