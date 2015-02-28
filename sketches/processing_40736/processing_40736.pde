

jDot[] dots = new jDot[50]; //how many initial points would you like? 25, 50, how about 500





void setup() {
  size(300, 300);
  background(0);

  for (int j=0; j < dots.length;j++) {
    dots[j] = new jDot(width/2, height/2); //seeds point array.
  }
}





void draw() {

  for (int j=0; j < dots.length; j++) {
    dots[j].move(); //sets up move command.
    dots[j].display(); //sets up the drawing of points.
  }
}





class jDot {

  float x;
  float y;

  jDot(float x_, float y_) {
    x = x_;
    y = y_;
  }


  //draws the points with random grayscale stroke color.
  void display() {
    stroke(random(0, 255));
    point(x, y);
  }


  //Moves the dots randomly in x or y between -5 and 5 points.
  void move() {
    x = x + random(-5, 5);
    y = y + random(-5, 5);
  }
}



