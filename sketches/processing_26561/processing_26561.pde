
Circle[] circles;
float gravity =0.3;
float friction = -0.9;

void setup () {
  size(500,500);
  smooth();
  fill(46,35,26);
  circles = new Circle[1000];
  for(int i =0; i < circles. length; i++) {
    circles[i] = new Circle(random(5,height), random(5,width), random(20), random(-1), random(10));
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
  
  //contructor
  Circle(float xpos, float ypos, float dia, float friction, float gravity) {
    x = xpos;
    y = ypos;
    dia = diameter;
    vx= 0.09;
    vy= 0.9;
    
  }
  void display() {
    fill(46,35,26);
    ellipse(x,y,30,30);
    fill(62,44,22);
    ellipse(x,y,15,15);
  }
  void move () {
   vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) { 
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
    
  }
} 


