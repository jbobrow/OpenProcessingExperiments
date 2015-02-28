
Gun jit;
Gun gun;
void setup() {
  size (1080,800);
  smooth();

jit = new Gun (100,100, 50);
gun = new Gun(200,100, 10);
}
void draw(){
 jit.move();
 jit.display();
  gun.move();
  gun.display();
}

class Gun {
  float x;
  float y;
  int diameter;
  float speed = 10.0;
  Gun(float tempX, float tempY, int tempDiameter) {
x = tempX;
y = tempY;
diameter = tempDiameter;
}
void move() {
x += random(+speed,speed);
y += random(-speed,speed);
}
void display() {
rect(x,y,diameter,diameter);
}
}


