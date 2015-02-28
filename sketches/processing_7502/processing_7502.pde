
/**
 * Array Objects. 
 * 
 * Demonstrates the syntax for creating an array of custom objects. 
 */

int nCircles = 1; //number of circles

Circle[] circles = new Circle[nCircles]; // Declare an array of objects (circles)

void setup() {
  // Standard Setup
  size(500, 500);
  noStroke();
  smooth();

  // Construct the first circle
  circles[0] = new Circle(250, 250, 400);  
 background(255);
 
}

void draw(){
  for (int i = 0; i < circles.length; i++) {
    circles[i].display();
  }
}

void mousePressed(){
  
  for (int i = 0; i < circles.length; i++) {
    if(dist(mouseX, mouseY, circles[i].x, circles[i].y) < circles[i].d/2){
      circles[i].create(circles[i].x, circles[i].y, circles[i].d);

    }
  }
}

class Circle {
  float x, y, d; // Class variables

  // Contructor
  Circle(float _x, float _y, float _d) {
    x = _x;
    y = _y;
    d = _d;
  }

  void create(float xpos, float ypos, float diameter){
    Circle c = new Circle(xpos/2, ypos/2, diameter/2.2);
    Circle e = new Circle(xpos/2, (ypos/2)*3, diameter/2.2);
    Circle f = new Circle((xpos/2)*3, ypos/2, diameter/2.2);
    Circle g = new Circle((xpos/2)*3, (ypos/2)*3, diameter/2.2);
    circles = (Circle[]) append(circles, c);
    circles = (Circle[]) append(circles, e);
    circles = (Circle[]) append(circles, f);
    circles = (Circle[]) append(circles, g);
  }

  void display() {
    fill(0);
    ellipse(x,y,d,d);
  }

}




