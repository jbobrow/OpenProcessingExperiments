
//Code From Class: Array Lists, classes
//Ben Norskov
//Nov. 16, 2012

CircleGrow gregory;
CircleGrow marty;

ArrayList newCircles = new ArrayList();

void setup() {
  size(700, 500);

  gregory = new CircleGrow(145, 340, 255);
  newCircles.add(gregory);

  marty = new CircleGrow(300, 100, 100);
  marty.shrink_value = .4;
  newCircles.add(marty);

  smooth();
}
void draw() {
  background(200);

  for (int i = 0; i<newCircles.size(); i += 1) {
    CircleGrow tempCG = (CircleGrow) newCircles.get(i);
    tempCG.display();
    if (mousePressed == true) {
      tempCG.grow();
    } else {
      tempCG.shrink();
    }
  }
}  
void keyPressed() {
  if (key == 'c') {
    //add a new Cirlce Grow Object
    CircleGrow tempCG = new CircleGrow(random(width), random(height), 120);
    newCircles.add(tempCG);
  }
  if (key == 'p') {
    //remove a circleGrow object
    newCircles.remove(0);
  }
}
class CircleGrow {
  float x;
  float y;
  int redValue;
  float circle_radius;
  float shrink_value;
  CircleGrow(float initial_x, float initial_y, int startRedValue) {
    x = initial_x;
    y = initial_y;
    redValue = startRedValue;
    circle_radius = 50;
    shrink_value = .2;
  }
  void display() {
    fill(redValue, 10, 130);
    ellipse(x, y, circle_radius, circle_radius);

    fill(100, 100, 255);
    ellipse(x, y+5, 20, 40);
  }
  void grow() {
    circle_radius = circle_radius + 10;
  }
  void shrink() {
    circle_radius = circle_radius - shrink_value;
  }
}
/*
gregory.display();
 marty.display();
 if (mousePressed == true) {
 gregory.grow();
 marty.grow();
 } else {
 gregory.shrink();
 marty.shrink();
 }
 */
