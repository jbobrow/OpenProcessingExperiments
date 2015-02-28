
Circle[] circles = new Circle[0];

void setup() {
  size(600, 400);
}

void draw() {
  background(255);



  if (circles.length > 40) {
  }


  for (int i = 0; i < circles.length; i++) {
    circles[i].display();
    if (circles[i].r > 200 && circles[i].clicked == true) {
      addCircle();
      circles[i].pop();
    }
  }
}

void mousePressed () {
  //make a new circle
  addCircle();
}

void mouseReleased() {
  for (int i = 0; i < circles.length; i++) {
    circles[i].clicked = false;
  }
}

void addCircle() {
  circles = (Circle[]) expand(circles, circles.length+1);
  circles[circles.length-1] = new Circle(mouseX, mouseY);
  circles[circles.length-1].clicked = true;
}


class Circle {

  float x, y, r;
  boolean clicked = false;

  Circle(float tx, float ty) {
    x = tx;
    y = ty;
  } 

  void display() {

    if (clicked) {
      r++;
    }
    noFill();
    stroke(0);
    ellipse(x, y, r, r);
  }
  void pop() {
    this.r = 20;
  }
}

