
/*Assignment 7
 
 Fills canvas with lots of circles of different
 radii that do not overlap
 
 Arturo Alviar
 1/15/14
 */


final int WIDTH = 600;
final int HEIGHT = 600;

Circle[] circles = new Circle[2000];
int numCircles = 0;

void setup() {
  size(WIDTH, HEIGHT);
  background(0);
  noStroke();
}

void draw() {
  if (numCircles < circles.length) { // check if there is room for more circles
    Circle c = new Circle(); //create a new circle object
    if (c.d > 2) { // check if diameter is at least bigger than 2
      c.paint(); // make the circle
      circles[numCircles] = c; // put circle in array
      numCircles++; //increment the circle counter
    }
  }
}


//Cirlce Class
class Circle {
  float x, y, d;
  Circle() {
    d = 200; // biggest d
    x = random(width);
    y = random(height);
    for (int i = 0; i < numCircles; i++) {
      float tempVal = dist(x, y, circles[i].x, circles[i].y)- circles[i].d/2 ;
      d = min(d, 2*tempVal);
    }
  }

  void paint() {
    fill(random(100, 255), random(100, 255), random(100, 255));
    checkCircles();
    ellipse(x, y, d, d);
  }

  void checkCircles() {
    if ((x+d/2> width)) {
      d = 2*(width-x);
    }
    if ((x - d/2< 0)) {
      d = 2 * x;
    }
    if ((y> height-d/2)) {
      d =2*(height-y);
    }
    if ((y - d/2< 0)) {
      d =2*y;
    }
  }
}


void keyReleased() {
  switch(key) {
  case 's':
    saveFrame("aalviar_hw7a-####.png");
    break;
  }
} 


