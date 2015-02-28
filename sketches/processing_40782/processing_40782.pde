
//Lecture 7_1
//Using point to move across the screen in a random path

int num =100;
//declaring myPoint and color option
Point[] myPoint = new Point[num];
color[] myColors = new color[5];

void setup() {
  size(300, 300);
  background(35);
  //explicitly add colors to the myColors array
  myColors[0] = color(83, 210, 232, random(20, 80));
  myColors[1] = color(91, 188, 255, random(40, 50));
  myColors[2] = color(104, 255, 236, random(30, 40));
  myColors[3] = color(83, 232, 171, random(20, 40));
  myColors[4] = color(91, 255, 142);

  // seed the array with initialized point object
  for (int i=0; i < myPoint.length; i++) { 
    myPoint[i] = new Point();
  }
}

void draw () {

  // iterate through the point array and update and draw the objects
  for (int i=0; i< myPoint.length; i++) {
    myPoint[i].update();
    myPoint[i].draw();
  }
}

class Point {
  color col = myColors[floor(random(0, 4))];

  float xpos = random(5, 270);
  float ypos = random(60, 230);

  //point constructor is empty
  Point() {
  }

  void update() {
    xpos = xpos + random (-2, 2);
    ypos = ypos + random (-2, 2);
    if (xpos < 150);
    if (ypos < height);
    xpos = xpos +2;
    ypos = ypos -2;
    if (xpos > width/2);
    xpos = xpos - random(1, 1.1);
    ypos = ypos +2;
  }

  void draw() {
    stroke (col);

    strokeWeight (random (.5, 2));
    point(.3 * PI * xpos, .3 * PI * ypos);
  }
}


