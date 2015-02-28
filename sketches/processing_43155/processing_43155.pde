
Circle[] circles = new Circle[0];

void setup() {
  size(600, 400);
}

void draw() {
  background(255);



  for (int i = 0; i < circles.length; i++) {
    circles[i].display();
    if (circles[i].r > 50 && circles[i].clicked == true) {
      addCircle();
      circles[i].r = 20;
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


    if (r > 400) {
      this.pop();
    }
  }

  void pop() {
    println("pop");
    this.r = 10;
    this.x = this.x - this.r;
//    this.y = this.y - this.r;
    ellipse(this.x+this.r,this.y+this.r, 10,10);
  }
}

