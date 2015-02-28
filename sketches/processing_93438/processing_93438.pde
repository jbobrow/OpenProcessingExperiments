
Robot jit;
Robot bug;


void setup() {
  background(106,168,82);
  size (400,400);
  smooth();
jit = new Robot (30, 100, 50);
bug = new Robot (100, 50, 10);
}

void draw(){
 jit.move();
 jit.display();
  bug.move();
  bug.display();
}
 
class Robot {
  float x;
  float y;
  int diameter;
  float speed = 8.5;
  
Robot(float tempX, float tempY, int tempDiameter) {
x = tempX;
y = tempY;
diameter = tempDiameter;
}

void move() {
x += random(-speed,speed);
y += random(-speed,speed);
}

void display() {
ellipse(200,y,diameter,diameter);
fill(255,205,42);
}
}



