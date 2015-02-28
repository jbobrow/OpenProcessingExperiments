
Obstacle one; // first Obstacle
Obstacle two; //second Obstacle
void setup() {
  size (320,480);
  smooth();
 background(142,25,156);
one = new Obstacle (50,80, 60); // first Obstacle size
two = new Obstacle (78,52, 72); // second Obstacle size
}
void draw(){
 one.move();
 one.display();
  two.move();
  two.display();
}
 
class Obstacle {
  float x;
  float y;
  int diameter;
  float speed = 4;
  Obstacle(float tempX, float tempY, int tempDiameter) {
x = tempX;
y = tempY;
diameter = tempDiameter;
}
void move() {
x += random(-speed,+speed);
y += random(-speed,speed);
}
void display() {
rect(x,y,diameter,diameter);
fill(20,186,37);
}
}


