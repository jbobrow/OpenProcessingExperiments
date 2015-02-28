
Espresso dot1;
Espresso dot2;

void setup() {
  size (400,400);
  smooth();
  background(0,204,255);
  dot1 = new Espresso (125,200,80);
  dot2 = new Espresso (275,200,80);
}

void draw(){
  dot1.move();
  dot1.display();
  dot2.move();
  dot2.display();
}
  
class Espresso {
  int diameter;
  float speed = 8;
  float x;
  float y;
  Espresso(float tempX, float tempY, int tempDiameter) {
  x = tempX;
  y = tempY;
  diameter = tempDiameter;
}

void move() {
x += random(-speed,+speed);
y += random(-speed,speed);
}

void display() {
ellipse(x,y,diameter,diameter);
fill(255,51, 153);
}
}



