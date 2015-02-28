
int numCircles=40;
Circle[] circle = new Circle[numCircles];


void setup() {
  size(600, 600);
    for (int i=0; i<numCircles; i++) {
    circle[i]= new Circle(random(40, width-40), random(40, height-40), 80, 255, 50);
    }
}


void draw() {
  background(0);
  for (int i=0; i<numCircles; i++) {
    circle[i].display();
    circle[i].mouse();
  }
}


