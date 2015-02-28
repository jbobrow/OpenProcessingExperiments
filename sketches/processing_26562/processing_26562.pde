
Circle[] circles;
float gravity =0.1;
float friction = -0.9;

void setup () {
  size(500,500);
  smooth();
  fill(46,35,26);
  circles = new Circle[2500];
  for(int i =0; i < circles. length; i++) {
    circles[i] = new Circle(random(height), random(width), random(20), random(-1), random(10));
  }
}
void draw() {
  background(15,45,121);
  for(int i = 0; i < circles.length; i ++) {
    circles[i]. display();
    circles[i].move();
  }
}

class Circle {
  float x, y, vx,vy, diameter;
  Circle(float xpos, float ypos, float dia, float friction, float gravity) {
    x = xpos;
    y = ypos;
    dia = diameter;
    vx= 0.09;
    vy= 0.9;
    
  }
  void display() {
    ellipse(x,random(y),20,20);
    ellipse(random(x), y,20,20);
  }
  void move () {
   vy += gravity;
    x += vx;
    y += vy;
    if (x > width) {
      x = width;
      vx *= friction; 
    }
    else if (x  < 0) { 
      x = 0;
      vx *= friction;
    }
    if (y  > height) {
      y = height;
      vy *= friction; 
    } 
    else if (y < 0) {
      y = 0;
      vy *= friction;
    }
    
  }
} 


